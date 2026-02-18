class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy
  has_many :reward_activities, dependent: :destroy
  has_many :push_devices, class_name: "ApplicationPushDevice", as: :owner, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  normalizes :email, with: -> { _1.strip.downcase }
end
