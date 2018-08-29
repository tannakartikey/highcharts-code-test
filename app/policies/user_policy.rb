class UserPolicy < ApplicationPolicy
  def admin_list?
    user.has_role? :admin
  end
end
