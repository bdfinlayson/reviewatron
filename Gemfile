source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '~> 4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'puma'
gem 'ffaker'
gem "trailblazer-rails"
gem "cells"

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'pry-byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
  gem 'active_model_serializers-matchers', github: "igmarin/active_model_serializers-matchers"
  gem 'capybara'
  gem 'capybara-webkit'
end

group :test do
  gem 'rspec-given'
  gem 'simplecov', :require => false
end
