class Conversation
  include Mongoid::Document

  belongs_to :announcement
  embeds_many :interactions
  field :closed, type: Boolean, default: false
  belongs_to :interlocutor, class_name: "User"
  belongs_to :originator, class_name: "User"
  
  before_save :set_originator
  
  scope :open, ->(user) do where(interlocutor_id: user.id) end
  
  def set_originator
    originator = announcement.user
  end
  
end
