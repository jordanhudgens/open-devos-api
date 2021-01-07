class UserSerializer < ActiveModel::Serializer
  attributes :avatar_url,
             :email,
             :full_name,
             :id,
             :profile_slug,
             :slug,
             :updated_at,
             :username

  has_many :plans
  has_many :bookmarks
  has_many :plan_assignments
  has_many :devo_completions
end
