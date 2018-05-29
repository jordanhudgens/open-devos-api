class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :plans
end
