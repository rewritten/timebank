class Announcement
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  include Mongo::Voteable
  include Mongoid::Taggable
  
  field :text, type: String
  belongs_to :user

  # set points for each vote
  voteable self, up: +1, down: -1
end
