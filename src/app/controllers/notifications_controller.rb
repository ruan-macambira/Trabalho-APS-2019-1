class NotificationsController < ApplicationController
  def show
    authenticate_user!
    @notifications = Notification.where(user: current_user).order(created_at: :desc)
  end
end
