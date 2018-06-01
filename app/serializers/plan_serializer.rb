class PlanSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary

  has_many :devos
end
