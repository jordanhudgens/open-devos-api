class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :slug

  has_many :plans
end
