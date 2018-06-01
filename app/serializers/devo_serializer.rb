class DevoSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :position, :status, :slug
end
