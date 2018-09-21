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
    puts "CALLED FROM PUBLISHED AND DRAFT" * 500, @instance_options.inspect, "PUBLISHED AND DRAFT" * 500
    @object.devos
  end
end
