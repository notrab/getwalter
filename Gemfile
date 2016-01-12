source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
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
  gem 'rails_12factor'
  gem 'librato-rails'
end

gem 'foreman'
gem 'unicorn'
gem 'sidekiq'
gem 'sinatra', :require => nil
gem 'has_secure_token'
gem 'rack-cors', :require => 'rack/cors'
gem 'clearance'
gem 'mixpanel-ruby'

gem 'angular-rails4-templates'

source 'https://rails-assets.org' do
  gem 'rails-assets-angular'
  gem 'rails-assets-ui-router'
end
