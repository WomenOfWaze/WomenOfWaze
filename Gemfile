source 'http://rubygems.org'

gem "rails", "3.1.0"
gem "high_voltage"
gem "paperclip"
gem "validation_reflection"
gem "formtastic"
gem "dynamic_form"
gem "jquery-rails"
gem 'aws-s3'
gem "json"
gem "devise"
gem "mysql"

group :assets do
  gem "sass-rails", "  ~> 3.1.0"
  gem "coffee-rails", "~> 3.1.0"
  gem "uglifier"
end

# RSpec needs to be in :development group to expose generators
# and rake tasks without having to type RAILS_ENV=test.
group :development, :test do
  gem 'execjs'
#  gem 'therubyracer'
  gem "mysql"
 gem "rspec-rails", "~> 2.6.1"
 gem "ruby-debug",   :platforms => :mri_18
 gem "factory_girl_rails"
 gem "faker"
end

group :development do
  gem 'letter_opener'
end

group :production do
  gem "pg"
end

group :test do
  gem "cucumber-rails", "1.0.2"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "timecop"
  gem "shoulda-matchers"
  gem "launchy"
  gem "capybara"
#  gem "capybara-webkit"
end
