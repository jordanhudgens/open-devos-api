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
    if devo.send(:instance_options)['published_and_draft']
      puts "-" * 500, devo.send(:instance_options)['published_and_draft']
      @object.devos
    else
      puts "X" * 500, devo.send(:instance_options)['published_and_draft']
      @object.devos.published
    end
  end
end
