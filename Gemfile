source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
#gem 'foreman', git: 'git@github.com:Tonkpils/foreman.git', branch: 'fix-debian-process-bug'
gem 'foreman', :git => "git@github.com:pub-burrito/foreman.git", :branch => "cloudcom"
gem 'clockwork'
gem 'sidekiq'
gem 'slim', '>= 1.3.8'
gem 'sinatra'
gem 'awesome_print'
gem 'sidekiq-failures'
gem 'syslogger'

gem 'airbrake'

gem 'haml-rails'

group :test do
  gem 'rake'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

gem 'faraday'

gem 'multi_json', '~> 1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'zurb-foundation'
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
