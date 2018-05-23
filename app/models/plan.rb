class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :devos, dependent: :destroy
end
