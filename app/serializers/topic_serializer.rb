class TopicSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :thumbnail,
             :banner

  has_many :plans do
    @object.plans.published
  end
end
