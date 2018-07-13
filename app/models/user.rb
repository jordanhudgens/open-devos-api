class User < ApplicationRecord
  extend FriendlyId
  friendly_id :profile_slug, use: :slugged

  has_secure_password
  validates :email, presence: true
  has_many :plans, dependent: :destroy

  has_many :plan_assignments, dependent: :destroy
  has_many :plans, through: :plan_assignments

  validates_presence_of :email, :password, :password_confirmation
end
