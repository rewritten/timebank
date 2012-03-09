#!/  ruby


source 'http://rubygems.org'

gem 'wirble'
gem 'thin'
gem 'rails'
gem 'mongoid'
gem 'bson_ext'

# auth
gem 'devise'

# model extras
gem 'mongoid_taggable'
gem 'voteable_mongo'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'
gem 'haml-rails'
gem 'hpricot' # required by html2haml
gem 'ruby_parser' # required by html2haml

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
group :development, :test do
  gem 'rspec-rails'
  gem 'mongoid-rspec', :require => false
  gem 'database_cleaner'
end