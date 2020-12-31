namespace :caching do
  desc "Creates data objects for the public payloads"
  task user_data_updater: :environment do
    Author.with_plans.each do |author|
      puts "Updating data store cache for #{author.full_name}..."
      DataStoreUpdateJob.perform_later(author)
    end
  end
end
