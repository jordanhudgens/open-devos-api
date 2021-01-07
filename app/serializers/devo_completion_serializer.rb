class DevoCompletionSerializer < ActiveModel::Serializer
  attributes :created_at,
             :devo_id,
             :id,
             :updated_at,
             :user_id

  belongs_to :user
  belongs_to :devo
end
