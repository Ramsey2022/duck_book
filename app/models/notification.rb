class Notification < ApplicationRecord
  belongs_to :notifier, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :comment, optional: true
  belongs_to :like, optional: true
end
