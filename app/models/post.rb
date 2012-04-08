require 'mongoid/autotitle'
require 'mongoid/denormalize'
require 'mongoid/full_text_index'
require 'mongoid/none'
require 'mongoid/publishable'
require 'mongoid/taggable'

class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Symbolize
  # include Mongo::Voteable

  include Mongoid::Autotitle
  include Mongoid::Denormalize
  include Mongoid::FullTextIndex
  include Mongoid::Publishable
  include Mongoid::Taggable
  include Mongoid::None

  field :content, type: String
  symbolize :type, within: [:offer, :request], allow_blank: false,
    scopes: true, methods: true

  autotitle on: :content
  full_text_index on: :content

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  denormalize :name, from: :author
  
  
end
