class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to notifications_path
  end

  def clear_notifications
    current_user.notifications.destroy_all
    redirect_to notifications_path
  end
end
