#!/  ruby


source 'http://rubygems.org'

gem 'wirble'
gem 'thin'
gem 'rails'
gem 'mongoid'
gem 'bson_ext'

# auth
gem 'devise'
gem "omniauth-facebook"
gem "cancan"

# backbone
gem 'backbone-on-rails'

# model extras

# see: https://github.com/nofxx/symbolize
gem "symbolize", :require => "symbolize/mongoid"

# gem 'mongoid_taggable'

# add "published_at" field, and some related scopes and methods
# see: https://github.com/thetron/mongoid_publishable
# gem 'mongoid_publishable'


# see: https://github.com/mgolovnia/mongoid_commentable
gem 'mongoid_commentable'

gem 'voteable_mongo'


gem 'rails_admin'

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

# views and assets

gem 'haml-rails'
gem 'coffee-rails'
gem 'sass-rails'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'



# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
group :development, :test do
  gem 'capistrano'
  gem 'rspec-rails'
  gem 'mongoid-rspec', :require => false
  gem 'database_cleaner'
  gem 'hpricot' # required by html2haml
  gem 'ruby_parser' # required by html2haml
end

group :production do
  gem 'therubyracer'
  gem 'yui-compressor'
  gem 'uglifier'
end
