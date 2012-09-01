source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.8'
gem 'foreman'
gem 'puma'

# Persistence & caching
gem 'mongoid'
gem 'memcachier'
gem 'dalli'

# Frontend
gem 'jquery-rails'
gem 'simple_form'
gem 'kaminari'
gem 'requirejs-rails'
gem 'twitter-bootstrap-rails'

# Auth & auth
gem 'bcrypt-ruby'
gem 'sorcery'
gem 'cancan'

# Misc frameworks, libs
gem 'rails_config'
gem 'aws-sdk'
gem 'heroku'
gem 'rdiscount'
gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-mongoid', git: 'git://github.com/jnicklas/carrierwave-mongoid.git', branch: 'mongoid-3.0'
gem 'fog'

group :assets do
  gem 'ejs'
  gem 'execjs'
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'oily_png'
  gem 'asset_sync'
  gem 'js-routes'
end

group :development do
  gem 'pry-remote'
end

group :test, :development do
  gem 'rb-fsevent'

  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'factory_girl_rails'

  gem 'email_spec'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'launchy'

  gem 'spork'
  gem 'guard-bundler'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
end

