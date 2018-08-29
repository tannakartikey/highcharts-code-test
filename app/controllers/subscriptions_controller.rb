class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def index
    # @plans = gateway.plan.all
  end

  def new
    @subscription = Subscription.new
    @subscription.plan_id = params[:plan_id]
    @client_token = gateway.client_token.generate
  end

  def create
    nonce = params["payment_method_nonce"]

    # Create braintree customer
    customer_create = gateway.customer.create(
      :email => current_user.email
    )

    payment_method_create = gateway.payment_method.create(
      :customer_id => customer_create.customer.id,
      :payment_method_nonce => nonce
    )

    result = gateway.subscription.create(
      payment_method_token: payment_method_create.payment_method.token,
      plan_id: subscription_params[:plan_id]
    )
    
    if result.success?
      # create subscription record
      subscription = Subscription.create(
        user:             current_user,
        plan_id:          subscription_params[:plan_id],
        customer_id:      customer_create.customer.id,
        subscription_id:  result.subscription.id
      )

      if subscription.valid?
        flash[:notice] = "Your subscription was created successfully."
      end
    else
      error_messages = result.errors.map { |error| "Error: #{error.message}" }
      flash[:error] = error_messages
    end

    redirect_to users_subscriptions_path
  end

  protected

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
      }
    end
  end

  def subscription_params
    params.require(:subscription).permit(:plan_id)
  end
end
