module ApplicationHelper
  def user_status(user)
    if user.invited_by.present? && user.invitation_accepted_at.blank?
      'Invited'
    elsif user.blank?
      'Inactive'
    else
      'Active'
    end
  end
end
