class DataStoreUpdateJob < ApplicationJob
  queue_as :data_updates

  def perform(user_id: nil, name:)
    if user_id && user = User.find(user_id)
      if name == "user_plans"
        payload = UserPlansSerializerService.new(user).run!
      end
    elsif name == "featured_plans"
      payload = FeaturedPlansSerializerService.new(user).run!
    end

    if payload
      user.data_stores.create!(
        name: name,
        payload: payload
      )
    end
  end
end
