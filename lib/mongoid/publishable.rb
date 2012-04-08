# Much simpler than
# see: https://github.com/thetron/mongoid_publishable
module Mongoid
  module Publishable
    extend ActiveSupport::Concern

    included do
      field :published_at, :type => Time, :default => nil
      
      scope :scheduled, -> { where published_at: {'$gt' => Time.now} }
      scope :published, -> { where published_at: {'$lte' => Time.now} }
      scope :drafts, -> { where published_at: nil }
    end

    def publish=(value)
      self.published_at = Time.now
    end

    def scheduled?
      self.published_at && self.published_at > Time.now
    end

    def published?
      self.published_at && self.published_at <= Time.now
    end

    def draft?
      self.published_at.nil?
    end

    def schedule!(time)
      update_attributes published_at: time
    end

    def publish!
      update_attributes published_at: Time.now
    end

    def unpublish!
      update_attributes published_at: nil
    end

    def as_json(options={})
      [:scheduled?, :published?, :draft?].inject(super(options)) do |h, flag|
        h.update flag => self.send(flag)
      end
    end
    


  end
end
