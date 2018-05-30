class PlanSerializer < ActiveModel::Serializer
  attributes :title, :slug, :id

  has_many :devos
end
