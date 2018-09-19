class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :plans, dependent: :destroy

  validates_presence_of :title

  def published_plans
    self.plans.where(status: 'published')
  end
end
