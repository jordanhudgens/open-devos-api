class PlanSerializer < ActiveModel::Serializer
  attributes :title, :slug

  has_many :devos
end
