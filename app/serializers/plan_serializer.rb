class PlanSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :summary,
             :status,
             :last_published,
             :featured_image,
             :devos

  belongs_to :topic
  belongs_to :user

  def devos
      puts "SERIALIZER STUFF" * 100, @instance_options.inspect, "SERIALIZER STUFF" * 100
      if @instance_options[:published_and_draft]
        @object.devos
      else
        @object.devos.published
      end
  end
end
