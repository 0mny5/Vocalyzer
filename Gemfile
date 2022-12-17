source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6'

# server
gem 'puma', '~> 5.0'

# assets
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# UI/UX
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jquery-rails'
gem 'mini_magick'
gem 'puppeteer-ruby'
gem 'ransack'
gem 'rails-i18n', '~> 6.0'
gem 'enum_help'
gem 'meta-tags'

# form
gem 'cocoon'

# JShelper
gem 'gon'

# config
gem 'dotenv-rails'

# authenticate
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-oauth2'
gem 'omniauth-twitter2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # db
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'letter_opener_web'
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  gem 'mysql2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
