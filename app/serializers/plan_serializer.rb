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

  has_many :devos do |devo|
    puts "CALLED FROM PUBLISHED AND DRAFT" * 500, devo.send(:instance_options).inspect, "PUBLISHED AND DRAFT" * 500
    if devo.send(:instance_options)['published_and_draft']
      @object.devos
    else
      @object.devos.published
    end
  end
end
