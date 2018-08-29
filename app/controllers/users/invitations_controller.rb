class Users::InvitationsController < Devise::InvitationsController
  before_action :verify_authenticity_token, only: :create
  layout 'user'

  def update
    invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
    self.resource = resource_class.where(invitation_token: invitation_token).first
    # Find inviter
    resource.user = resource.invited_by.user
    if resource.save
      super
    end
  end

  protected

  def after_invite_path_for(inviter, invitee)
    analytics_url(inviter)
  end

  def after_accept_path_for(resource)
    analytics_url(resource)
  end
end
