class Devo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :plan

  enum status: {
    draft: 0,
    published: 1
  }

  validates_presence_of :title, :content, :position, :plan_id
end
