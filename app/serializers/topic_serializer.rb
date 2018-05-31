class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug

  has_many :plans
end
