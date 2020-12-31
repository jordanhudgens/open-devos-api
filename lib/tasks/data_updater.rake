namespace :caching do
  desc "Creates data objects for the public payloads"
  task user_data_updater: :environment do
    Author.with_plans.each do |author|
      puts "Updating data store cache for #{author.full_name}..."
      DataStoreUpdateJob.perform_later(user_id: author.id, name: "user_plans")
    end
  end

  desc "Creates data objects for the featured plan payloads"
  task featured_plans_data_updater: :environment do
    puts "Updating featured plans"
    DataStoreUpdateJob.perform_later(name: "featured_plans")
  end
end
