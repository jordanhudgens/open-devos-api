class PlanSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary

  belongs_to :topic
  belongs_to :user
  has_many :devos
end
