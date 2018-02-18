source 'https://rubygems.org'

ruby '2.3.4'

gem 'mime-types', '>= 2.6.1', require: 'mime/types/columnar'
gem 'rails', '~> 5.1.0'
gem 'rake'
gem 'pg'
gem 'puma'

gem 'slim-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'font_assets'
gem 'autoprefixer-rails'
gem 'webpacker', '~> 3.0'

gem 'responders'
gem 'jsonb_accessor'

# Simple transparent captchas
gem 'honeypot-captcha', github: 'RandieM/honeypot-captcha', branch: 'master'

gem 'emma', github: 'myemma/EmmaRuby'

gem 'devise'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'gravatarify'

gem 'html-pipeline', require: 'html/pipeline'
gem 'commonmarker'
gem 'sanitize'
gem 'rinku'
gem 'gemoji'
gem 'liquid'

gem 'textacular'

gem 'icalendar'

gem 'premailer-rails'
gem 'sendgrid', github: 'caring/sendgrid'
gem 'sendgrid-ruby'
gem 'retries'

# State machines
gem 'simple_states'

# API
gem 'active_model_serializers', '~> 0.8.0'

# Production support
gem 'utf8-cleaner'
gem 'newrelic_rpm'
gem 'honeybadger'
gem 'rack-canonical-host'

# Admin interface
gem 'activeadmin'
gem 'activeadmin-ajax_filter', '>= 0.3.7', github: 'jayzes/activeadmin-ajax_filter'
gem 'paper_trail'

# Background processing
gem 'sidekiq'
gem 'sidekiq-throttled'

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
  gem 'selenium-webdriver', '~> 2.53'
  gem 'database_cleaner'
  gem 'email_spec', '~> 2.1.0'
  gem 'vcr'
  gem 'webmock', require: false
  gem 'factory_bot_rails'
  gem 'rspec-rails-time-metadata'
end

group :production do
  gem 'rack-timeout'
  gem 'lograge'
  gem 'memcachier'
  gem 'dalli'
  gem 'heroku-deflater'
end
