# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

# ruby "2.3.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 6.0.0"
# Use mysql as the database for Active Record
# Use Puma as the app server
gem "puma", "~> 4.3"
# Use SCSS for stylesheets
gem "sass-rails", "~> 6.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "duktape"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 5.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.9"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.13"

gem "devise", ">= 4.6.0" # framework for user authentification
gem "devise-security" # security plugin for devise
gem "devise_zxcvbn" # plugin for devise
gem "delayed_job_active_record" # for delayed jobs in ruby on rails
# gem "two_factor_authentication"

gem "font-awesome-sass"
gem "city-state" # get all countries with name and towns

gem "country_select", "~> 4.0"

# Use ActiveStorage variant
# gem "mini_magick", "~> 4.8"

# Charts
gem "chartkick", ">= 3.3.0"

gem "rqrcode"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# bootstrap
gem "jquery-rails"
gem "bootstrap"

# pdf
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

group :development, :test do
  gem "mysql2", ">= 0.4.4", "< 0.6.0"
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop"
  gem "rubocop-rails_config", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot"
  gem "brakeman"
  gem "rails_best_practices"
end
gem "faker" # framework to generate test data

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
  gem "capistrano-rails"
  gem "capistrano-bundler"
  gem "letter_opener"
  gem "rails_real_favicon"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper", "2.1.1"
  gem "simplecov", require: false
end


# Some stuff for Evensystem


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem "pg"
  gem "unicorn"
end
