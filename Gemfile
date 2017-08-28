source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.1.0'
gem 'rake'
gem 'pg'
gem 'puma'

gem 'jquery-rails'
gem 'haml-rails'
gem 'slim-rails'
gem 'bourbon'
gem 'sass-rails'
gem 'coffee-rails'
gem 'underscore-rails'
gem 'uglifier'
gem 'font_assets'
gem 'autoprefixer-rails'
gem 'select2-rails'

gem 'responders'
gem 'navigasmic'

# Simple transparent captchas
gem 'honeypot-captcha', github: 'RandieM/honeypot-captcha', branch: 'master'

gem 'simple_form'
gem 'kaminari'

gem 'emma', github: 'myemma/EmmaRuby'

gem 'devise'

gem 'html-pipeline', require: 'html/pipeline'
gem 'commonmarker'
gem 'sanitize'
gem 'rinku'
gem 'gemoji'
gem 'liquid'

gem 'textacular'

gem 'icalendar'

gem 'premailer-rails'

# State machines
gem 'simple_states'

# API
gem 'active_model_serializers', '~> 0.8.0'
gem 'graphql'

# Production support
gem 'utf8-cleaner'
gem 'newrelic_rpm'
gem 'honeybadger'

gem 'rack-canonical-host'

# Admin interface
gem 'activeadmin'
gem 'activeadmin-ajax_filter', '>= 0.3.7', github: 'jayzes/activeadmin-ajax_filter'
# gem 'meta_search',   '>= 1.1.0.pre'
gem 'paper_trail'

# Feature toggle
gem 'redis-objects'

# Background processing
gem 'sucker_punch'
gem 'retries'

group :development do
  gem 'listen'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6.0'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-select2', github: 'goodwill/capybara-select2'
  gem 'selenium-webdriver', '~> 2.53'
  gem 'database_cleaner'
  gem 'email_spec', '~> 2.1.0'
  gem 'webmock'
  gem 'factory_girl_rails'
  gem 'rspec-rails-time-metadata'
end

group :production do
  gem 'rack-timeout'
  gem 'lograge'
  gem 'memcachier'
  gem 'dalli'
end

gem 'graphiql-rails', group: :development