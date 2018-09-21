class PlanSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :slug,
             :summary,
             :status,
             :last_published,
             :featured_image,
             :some_devos

  belongs_to :topic
  belongs_to :user

  def some_devos
      puts "SERIALIZER STUFF" * 100, @instance_options.inspect, "SERIALIZER STUFF" * 100
      puts "OPTIONS" * 100, @options.inspect, "OPTIONS" * 100
      puts "@OBJECT" * 100, @object.inspect, "OBJECT" * 100
      @object.devos
      # if @instance_options[:published_and_draft]
      #   @object.devos
      # else
      #   @object.devos.published
      # end
  end
end
