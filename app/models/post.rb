require 'mongoid/autotitle'
require 'mongoid/full_text_index'
require 'mongoid/publishable'
require 'mongoid/taggable'

class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Symbolize
  # include Mongo::Voteable

  include Mongoid::Autotitle
  include Mongoid::FullTextIndex
  include Mongoid::Publishable
  include Mongoid::Taggable

  field :content, type: String
  symbolize :type, within: [:offer, :request], allow_blank: false,
    scopes: true, methods: true

  autotitle on: :content
  full_text_index on: :content

  belongs_to :author, class_name: "User", foreign_key: "author_id"
end
