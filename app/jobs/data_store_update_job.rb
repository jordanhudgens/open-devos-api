class DataStoreUpdateJob < ApplicationJob
  queue_as :data_updates

  def perform(user_id: nil, name:)
    if user_id && user = User.find(user_id)
      if name == "user_plans"
        payload = UserPlansSerializerService.new(user).run!
      end

      user.data_stores.create!(
        name: name,
        payload: payload
      )
    elsif name == "featured_plans"
      payload = FeaturedPlansSerializerService.new.run!

      DataStore.create!(
        name: name,
        payload: payload
      )
    end
  end
end
