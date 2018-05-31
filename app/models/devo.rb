class Devo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :plan

  validates_presence_of :title, :content, :position, :plan_id
end
