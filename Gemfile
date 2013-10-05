source 'https://rubygems.org'

gem 'rails'

# Backend
gem 'sqlite3'
gem 'ransack'
gem 'pg'
gem 'devise'
gem 'cancan'
#gem 'therubyracer', platforms: :ruby

# Frontend
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'

group :production do
  gem 'unicorn'
end

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'thin'
  gem 'quiet_assets'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'coveralls', require: false
end

