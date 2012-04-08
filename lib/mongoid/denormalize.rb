module Mongoid
  module Denormalize

    extend ActiveSupport::Concern

    included do
      class_attribute :denormalizations

      # add callback to save tags index
      before_save :do_denormalize, :if => :denormalizations

    end

    def do_denormalize
      return if self.denormalizations.blank?
      self.denormalizations.each do |field, subfields|
        next unless self.respond_to? field
        linked = self.send field
        subfields.each do |subfield|
          self["#{field}_#{subfield}"] = linked.send(subfield) if linked.respond_to? subfield
        end
      end
    end

    module ClassMethods

      def denormalize(*args, options)
        args.each do |subfield|
          field "#{options[:from]}_#{subfield}"
        end
        (self.denormalizations ||= {})[options[:from]] = args
      end

    end

  end
end
