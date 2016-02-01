class Group < ActiveRecord::Base
  has_many :enrollments
  has_many :joined_users, through: :enrollments, source: :user
  belongs_to :admin, class_name: "User"
  has_many :events
end
