source 'https://rubygems.org'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '5.0.0'
gem 'bootstrap-sass', '3.3.7'
gem 'sprockets', '3.7.1'
gem 'bcrypt-ruby', '3.1.5'
gem 'faker', '1.8.4'
gem 'will_paginate', '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec-its',  '~> 1.2.0'
  # The following optional lines are part of the advanced setup.
  gem 'guard-rspec', '~> 4.7.3', require: false
  #gem 'spork-rails'
  gem 'guard-spork', '2.1.0'
  gem 'childprocess', '0.7.1'
end

group :test do
  gem 'selenium-webdriver', '3.4.4'
  gem 'capybara', '2.14.4'
  gem 'factory_girl_rails', '4.8.0'
  gem 'cucumber-rails', '1.5.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment this line on OS X.
  gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.2'
  # gem 'wdm', '0.1.0'
end

gem 'sass-rails', '5.0.6'
gem 'uglifier', '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '5.0.1'
gem 'jbuilder', '2.7.0'

group :doc do
  gem 'sdoc', '0.4.2', require: false
end

group :production do
  gem 'pg', '0.21.0'
  gem 'rails_12factor', '0.0.3'
end
