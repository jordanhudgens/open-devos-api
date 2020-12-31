class User < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  has_secure_password
  validates :email, presence: true
  has_many :plans, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :devo_completions, dependent: :destroy
  has_many :plan_assignments, dependent: :destroy
  has_many :data_stores, dependent: :destroy

  has_one_attached :avatar

  validates_presence_of :email, :password, :password_confirmation, :full_name

  def avatar_url
    if self.avatar.attachment
      self.avatar.attachment.service_url
    end
  end
end
