class User < ActiveRecord::Base
  has_many :enrollments
  has_many :joined_groups, through: :enrollments, source: :group
  has_many :owned_groups, foreign_key: "admin_id", class_name: "Group"

  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: /\w+@\w+\.\w{2,3}/i, message: "please enter a valid email address"}
  validates :password, presence: true

  has_secure_password(validations: false)
end
