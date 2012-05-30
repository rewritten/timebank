module Mongoid
  module Commentable
    
    extend ActiveSupport::Concern
    included do |base|
      base.embeds_many :comments, :as => :commentable
      base.index [['comments', Mongo::ASCENDING]]
    end

    module ClassMethods

      def commentable?
        true
      end
    end

    def create_comment!(params)
      comment = comments.create!(params)
      comment.path = comment.parent ? comments.find(comment.parent).path + '.' + comment.id.to_s : "root."+comment.id.to_s
      comment
    end

    def comments_list(sort=:asc)
      if Comment.respond_to?(sort)
        comments.send(sort,:path)
      else
        raise ArgumentError, "Wrong argument!"
      end
    end

    def branch_for(comment_id)
      comments.select{|i| i.path =~ Regexp.new('^' + comments.find(comment_id).path)}
    end
    
    module Comment
      extend ActiveSupport::Concern

      included do |base|
        base.attr_accessible :path,:parent
        base.field :path, :type => String, :default => ""
        base.field :parent, :type => String
        base.field :deleted_at, :type => Time
        base.embedded_in :commentable, :polymorphic => true, :inverse_of => :comments
      end

      def level
        path.count('.')
      end

      def remove
        self.update_attribute(:deleted_at, Time.now)
      end

      def restore
        self.update_attribute(:deleted_at, nil)
      end

      def deleted?
        !!self.deleted_at
      end

    end




  end
end
