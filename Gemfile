source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'sqlite3'
gem 'devise'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'less-rails'
gem 'twitter-bootstrap-rails'

gem 'execjs'
# Javascript run time
gem 'therubyracer'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0', require: 'bcrypt'

gem 'i18n_generators'
gem 'simple_form'
gem 'kaminari'
gem "jquery_datepicker"
gem "jquery-ui-themes"

# mysql
gem 'mysql2'
# 国際化
gem 'rails-i18n'
# パンくずリスト対応
gem 'crummy'
# ユーザー認証
gem "devise"
# Amazon AWS
gem 'aws-ses'

################################################
# テスト環境用
################################################
group :test do
  gem 'spork'
  gem 'guard-spork'
  gem 'factory_girl_rails', '~> 1.4.0'
  gem 'rspec-rails'
  gem 'ruby_gntp'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rb-fsevent', :require => false
end

################################################
# テスト・開発環境用
################################################
group :test, :development do
  gem 'rails3-generators'
end

################################################
# 開発環境用
################################################
group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
  gem 'capistrano-unicorn', :require => false
  gem 'net-ssh'
end

################################################
# リハーサル環境用
################################################
group :staging do
  gem 'unicorn'
end

################################################
# 本番環境用
################################################
group :production do
  gem 'unicorn'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

