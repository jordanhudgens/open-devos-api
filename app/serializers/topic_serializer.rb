class TopicSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :thumbnail,
             :banner

  has_many :plans { @object.plans.published }
end
