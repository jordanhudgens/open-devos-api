class PlanSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary

  belongs_to :topic
  has_many :devos
end
