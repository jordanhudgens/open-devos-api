class TopicSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :thumbnail,
             :banner,
             :published_plans
end
