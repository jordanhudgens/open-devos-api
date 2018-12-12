class PlanSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :summary,
             :status,
             :last_published,
             :featured_image,
             :user_id

  belongs_to :topic
  belongs_to :user

  has_many :devos do |devo|
    if devo.send(:instance_options).dig(:published_and_draft)
      @object.devos
    else
      @object.devos.published
    end
  end
end
