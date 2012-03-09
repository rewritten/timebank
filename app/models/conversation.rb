class Conversation
  include Mongoid::Document

  embedded_in :announcement
  embeds_many :interactions
  field :closed, type: Boolean, default: false
  belongs_to :interlocutor, class_name: "User"
end
