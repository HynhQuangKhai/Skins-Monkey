source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 7.1.0"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 6.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "sassc-rails"
gem "bcrypt", "~> 3.1.7"
gem "image_processing", "~> 1.2"
gem 'tzinfo-data'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
