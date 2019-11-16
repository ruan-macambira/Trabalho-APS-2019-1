module ApplicationHelper
  def is_role?(role)
    user_signed_in? && current_user.role == role
  end
end
