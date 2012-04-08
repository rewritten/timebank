module Mongoid
  module None
    extend ActiveSupport::Concern

    included do
      scope :none, where(id: Float::INFINITY)
    end
    
  end
end
