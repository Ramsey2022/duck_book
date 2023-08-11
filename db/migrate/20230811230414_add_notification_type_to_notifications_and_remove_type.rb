class AddNotificationTypeToNotificationsAndRemoveType < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :notification_type, :string
    remove_column :notifications, :type, :string
  end
end
