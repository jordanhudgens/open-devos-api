class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  has_many :devos, dependent: :destroy
  has_many :plans, dependent: :destroy
end
