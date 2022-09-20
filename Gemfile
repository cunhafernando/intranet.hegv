source "http://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "image_processing", "~> 1.2"

gem 'carrierwave'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "letter_opener", "~> 1.8"
  gem 'bullet', '~> 7.0', '>= 7.0.3'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "kaminari", "~> 1.2"
gem 'simple_form', '~> 5.1'
gem "devise", "~> 4.8"

gem "pundit", "~> 2.2"
gem 'rolify', '~> 6.0'
gem "groupdate", "~> 6.1"
