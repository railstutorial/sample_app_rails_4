source 'https://rubygems.org'

gem 'rails', '4.0.0.beta1'

group :development, :test do
  gem 'sqlite3', '1.3.7'
  gem 'rspec-rails', '2.13.0'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', github: 'railstutorial/spork-rails', branch: 'rails-4'
  gem 'guard-spork', '1.5.0'
end

group :test do
  gem 'capybara', '2.0.2'
  gem 'rb-fsevent', '0.9.3', :require => false
  gem 'growl', '1.0.3'
end

group :assets do
  gem 'sass-rails',   '4.0.0.beta1'
  gem 'coffee-rails', '4.0.0.beta1'
  gem 'uglifier', '1.0.3'
end

gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.0.0'
gem 'jbuilder', '1.0.1'

group :production do
  gem 'pg', '0.14.1'
end