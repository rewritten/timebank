class Interaction
  include Mongoid::Document

  embedded_in :conversation
  belongs_to :from, class_name: "User"
end
