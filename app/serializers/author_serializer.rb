class AuthorSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :slug,
             :full_name,
             :avatar_url

  has_many :plans do
    @object.plans.published
  end
end
