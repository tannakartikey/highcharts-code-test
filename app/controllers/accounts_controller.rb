class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  layout 'user'

  
  def index
      @accounts = current_user.accounts
  end
 
  def new
    @account = Account.new
  end

  def edit
  end

  def show
    @account = Account.find(params[:id])
  end


  def create
    @account = Account.new account_params
    @account.user = current_user

    respond_to do |format|
      if @account.persisted?
        format.html { redirect_to account_path(@account), notice: 'account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    # @account.user = current_user

    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_path(@account), notice: 'account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
       
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name)
    end

end