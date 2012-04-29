require 'mongoid/autotitle'
require 'mongoid/denormalize'
require 'mongoid/full_text_index'
require 'mongoid/none'
require 'mongoid/publishable'
require 'mongoid/taggable'

class Announcement
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  include Mongoid::Autotitle
  include Mongoid::Denormalize
  include Mongoid::FullTextIndex
  include Mongoid::Publishable
  include Mongoid::Taggable
  include Mongoid::None

  symbolize :type, within: [:offer, :request], allow_blank: false,
    scopes: true, methods: true

  field :text
  autotitle on: :text
  full_text_index on: :text

  scope :open, ->(user) do
    where "conversations" => { "$elemMatch" => { "interlocutor_id" => user.id, "closed" => false }}
  end

  belongs_to :user
  denormalize :name, from: :user
  
  has_many :conversations

end
