module Mongoid
  module Autotitle

    extend ActiveSupport::Concern

    included do
      class_attribute :autotitle_on
      class_attribute :autotitle_split

      # create fields for tags and index it
      field :title, type: String, null: false

      # add callback to save tags index
      before_save :do_autotitle, :if => :autotitle_on

    end

    def do_autotitle
      return unless autotitle_on
      self.title = send(autotitle_on).split(autotitle_split, 2).first
    end

    module ClassMethods

      def autotitle(options={})
        options.assert_valid_keys :on, :split
        self.autotitle_on = options[:on]
        self.autotitle_split = options[:split] || /\.\s/
      end

    end

  end
end
