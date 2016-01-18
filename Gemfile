source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'jbuilder', '~> 2.0'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'mailcatcher'
  gem 'guard'
  gem 'guard-livereload', '~> 2.4', require: false
  gem 'rack-livereload'
end

group :production do
  gem 'librato-rails'
end

gem 'foreman'
gem 'unicorn'
gem 'sidekiq'
gem 'sinatra', :require => nil
gem 'has_secure_token'
gem 'rack-cors', :require => 'rack/cors'
gem 'mixpanel-ruby'
gem 'responders', '~> 2.0'
gem 'jwt-rb'
gem 'bcrypt'
