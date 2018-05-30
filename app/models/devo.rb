class Devo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :plan
end
