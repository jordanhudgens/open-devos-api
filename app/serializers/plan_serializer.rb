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

  def published_and_draft?
    if @instance_options[:published_and_draft]
      true
    else
      false
    end
  end

  has_many :devos do
    if published_and_draft?
      @object.devos
    else
      @object.devos.published
    end
  end
end
