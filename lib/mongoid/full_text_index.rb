# Usage: 
# class Blah
#   include Mongoid::Document
#   include Mongoid::FullTextIndex
#   
#   field :content, type: String
#   
#   full_text_index on: :content, split: some_regex, reduce: some_proc
#   
# end
# 
# Options:
#   - split:  The arg passed to String#split. Default is a regexp matching
#             any nonempty sequence of nonword characters.
#   - reduce: A proc or symbol, which will be called for each splitted word
#             to obtain the reduced form. Default is remove accents and other
#             diacritics
#
# The reduce function is applied also to the scope arguments, so they are 
# matched whatever their unreduced form
#

require 'unaccent'

module Mongoid
  module FullTextIndex
    extend ActiveSupport::Concern
    
    included do
      class_attribute :text_index_on
      class_attribute :word_reduce
      class_attribute :word_split
      class_attribute :word_downcase

      # create fields for tags and index it
      field :full_text_index, type: Array, default: []
      index [['full_text_index', Mongo::ASCENDING]]

      # add callback to save tags index
      before_save :do_text_index, :if => :text_index_on

      scope :with_word,     ->(w)  { where full_text_index: reduce_words(w).first }
      scope :with_words,    ->(*w) { all_in full_text_index: reduce_words(w) }
      scope :with_any_word, ->(*w) { any_in full_text_index: reduce_words(w) }

    end

    def do_text_index
      return unless text_index_on
      t = send(text_index_on).split(word_split)
      self.full_text_index = self.class.reduce_words(t).reject(:blank?)
    end
    
    def as_json(options={})
      options[:except] ||= []
      options[:except] << :full_text_index unless options[:except].include? :full_text_index
      super(options)
    end
    

    module ClassMethods
      
      def reduce_words(*words)
        words = words.flatten
        words = words.collect(&word_reduce) if word_reduce
        words = words.collect &:downcase if word_downcase
        words
      end

      def full_text_index(options={})
        options.assert_valid_keys :on, :reduce, :split, :downcase?
        self.text_index_on = options[:on]
        self.word_reduce = options[:reduce] || Unaccent.method(:unaccent)
        self.word_split = options[:split] || /[^[:word:]]+/
        self.word_downcase = options.fetch :downcase?, true
      end

    end

  end
end
