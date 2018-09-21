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

  def self.published_and_draft?
    puts "CALLED FROM PUBLISHED AND DRAFT" * 500, @instance_options.inspect, "PUBLISHED AND DRAFT" * 500

    if @instance_options[:published_and_draft]
      true
    else
      false
    end
  end

  has_many :devos do
    puts "CALLED FROM has_many" * 500, self.published_and_draft?, "has_many" * 500
    if self.published_and_draft?
      @object.devos
    else
      @object.devos.published
    end
  end
end
