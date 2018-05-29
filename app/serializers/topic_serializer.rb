class TopicSerializer < ActiveModel::Serializer
  attributes :title, :slug

  has_many :plans
end
