source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'bcrypt'
gem 'rack-cors', '~> 1.0', '>= 1.0.2'
gem 'active_model_serializers', '~> 0.10.7'
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'pundit', '~> 1.1'
gem 'pg_search', '~> 2.1', '>= 2.1.2'
gem "aws-sdk-s3", require: false
