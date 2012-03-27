require 'unaccent'

class Announcement
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  include Mongo::Voteable
  include Mongoid::Taggable

  TYPES = %w(offer request)

  scope :offers, where(type: "offer")
  scope :requests, where(type: "request")
  scope :open, ->(user) do
    where "conversations" => { "$elemMatch" => { "interlocutor_id" => user.id, "closed" => false }}
  end

  field :text, type: String
  field :fti, type: Array
  field :type, type: String
  belongs_to :user

  has_many :conversations

  # set points for each vote
  voteable self, up: +1, down: -1

  before_save :create_full_text_index

  validates :type, :inclusion => {:in => TYPES,
                                  :message => "%{value} must be one of #{TYPES.map(&:inspect) * ', '}"}

  def create_full_text_index
    self.fti = text.split(/[^[:word:]]+/).map(&Unaccent.method(:unaccent))
  end

  def title
    text.split(". ", 2)[0]
  end

end
