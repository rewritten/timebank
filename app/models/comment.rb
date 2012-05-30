class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid_Commentable::Comment
  attr_accessible :text, :author
  field :text, :type => String
  field :author, :type => String
  field :user_id, :type => String
  
  before_save :set_author
  
  def set_author
    self.user_id = Thread.current[:current_user].id rescue nil
  end

  def username
    User.find(user_id).name rescue "unknown"
  end

end
