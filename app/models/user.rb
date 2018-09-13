class User < ApplicationRecord
  extend FriendlyId
  friendly_id :profile_slug, use: :slugged

  has_secure_password
  validates :email, presence: true
  has_many :plans, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :devo_completions, dependent: :destroy

  has_many :plan_assignments, dependent: :destroy

  validates_presence_of :email, :password, :password_confirmation, :full_name

  def self.authors
    self.left_outer_joins(:plans).where.not(plans: {id: nil, status: 'draft'}).uniq
  end
end
