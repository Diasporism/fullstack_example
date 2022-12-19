source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.2'
gem 'rails', '~> 7.0.4'

gem 'bcrypt',             '~> 3.1.7' # Used for password encryption
gem 'cssbundling-rails',  '~> 1.1.1' # Used for bunding css files
gem 'jsbundling-rails',   '~> 1.0.3' # Used for bunding javascript files
gem 'jsonapi-serializer', '~> 2.2.0' # Used to generate JSON API responses
gem 'pg',                 '~> 1.2.3' # Used for Postgres
gem 'puma',               '~> 5.0'   # Used as the multi-threaded webserver
gem 'sassc-rails',        '~> 2.1'   # Used to compile Sass into CSS
gem 'stimulus-rails',     '~> 1.0.2' # Used for frontendy Javascript stuff
gem 'turbo-rails',        '~> 1.0.0' # Used for frontendy Javascript stuff

group :development, :test do
  gem 'rspec-rails',       '~> 5.1.2'  # Used for running specs
  gem 'pry-byebug',        '~> 3.9.0'  # Used for debugging
  gem 'factory_bot_rails', '~> 6.2.0'  # Used for generating test/fake data
  gem 'faker',             '~> 2.19.0' # Used for generating test/fake data
end

group :development do
  gem 'foreman', '~> 0.87.1' # Used for ./bin/dev and docker-compose.yml
end

group :test do
  gem 'simplecov', '~> 0.21.2', require: false # Used for test coverage calculations
end

# For Windows and other OSes which do not include zoneinfo files
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
