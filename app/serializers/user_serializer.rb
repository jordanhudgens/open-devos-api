class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :slug

  has_many :plans
  has_many :bookmarks
  has_many :plan_assignments
  has_many :devo_completions
end
