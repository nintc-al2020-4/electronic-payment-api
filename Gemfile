source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'redis-namespace', '~> 1.6'
# Use ridgepole for schema management
gem 'ridgepole', '~> 0.8'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use Pry as rails console
gem 'pry-rails', '~> 0.3'
# Make managing seeds better
gem 'seed-fu', '~> 2.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug', '~> 3.7'
  # Testing framework
  gem 'rspec-rails', '~> 3.8'
  # Speed up RSpec using Spring
  gem 'spring-commands-rspec', '~> 1.0'
  # Simplify request test code
  gem 'rspec-request_describer', '~> 0.3'
  # Simplify test code
  gem 'shoulda-matchers', '~> 4.1'
  # Run RSpec parallel
  gem 'parallel_tests', '~> 2.29'
  # Strategies for cleaning databases
  gem 'database_cleaner', '~> 1.7'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'
  # Run db:reset without stopping app
  gem 'pgreset', '~> 0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
