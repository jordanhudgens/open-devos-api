class DevoSerializer < ActiveModel::Serializer
  attributes :title, :content, :position, :status, :slug
end
