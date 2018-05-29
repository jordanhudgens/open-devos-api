class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :plans, dependent: :destroy
end
