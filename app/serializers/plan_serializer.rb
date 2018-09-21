class PlanSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :summary,
             :status,
             :last_published,
             :featured_image

  belongs_to :topic
  belongs_to :user

  has_many :devos do
    if @instance_options[:published_and_draft]
      @object.devos
    else
      @object.devos.published
    end
  end
end
