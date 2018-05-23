class Topic < ApplicationRecord
  has_many :plans, dependent: :destroy
end
