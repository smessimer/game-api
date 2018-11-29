class Relationship < ActiveRecord::Base
  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'
  belongs_to :activty_by_user, class_name: 'User'
  belongs_to :status
end
