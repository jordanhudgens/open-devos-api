class DevoSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :content,
             :position,
             :status,
             :slug,
             :last_published,
             :featured_image
end
