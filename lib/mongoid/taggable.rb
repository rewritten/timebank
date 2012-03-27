# Copyright (c) 2010 Wilker Lucio <wilkerlucio@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongoid
  module Taggable
    extend ActiveSupport::Concern

    TAGGABLE_MAP_FUNCTION = "function() {
      if (!this.tags_array) {
        return;
      }

      for (index in this.tags_array) {
        emit(this.tags_array[index], 1);
      }
    }"

    TAGGABLE_REDUCE_FUNCTION = "function(previous, current) {
      var count = 0;

      for (index in current) {
        count += current[index]
      }

      return count;
    }"


    included do
      # create fields for tags and index it
      field :tags_array, type: Array, default: []
      index [['tags_array', Mongo::ASCENDING]]

      # add callback to save tags index
      after_save do |document|
        if document.tags_array_changed
          document.class.save_tags_index!
          document.tags_array_changed = false
        end
      end

      attr_accessor :tags_array_changed

      scope :tagged_with, ->(tag) { any_in tags_array: [tag] }
      scope :tagged_with_all, ->(*tags) { all_in tags_array: tags.flatten }
      scope :tagged_with_any, ->(*tags) { any_in tags_array: tags.flatten }

      # enable indexing as default
      enable_tags_index!
    end

    module ClassMethods
      def tags
        tags_index_collection.master.find.to_a.map{ |r| r["_id"] }
      end

      # retrieve the list of tags with weight (i.e. count), this is useful for
      # creating tag clouds
      def tags_with_weight
        tags_index_collection.master.find.to_a.map{ |r| [r["_id"], r["value"]] }
      end

      def disable_tags_index!
        @do_tags_index = false
      end

      def enable_tags_index!
        @do_tags_index = true
      end

      def tags_separator(separator = nil)
        @tags_separator = separator if separator
        @tags_separator || ','
      end

      def tags_index_collection_name
        "#{collection_name}_tags_index"
      end

      def tags_index_collection
        @@tags_index_collection ||= Mongoid::Collection.new(self, tags_index_collection_name)
      end

      def save_tags_index!
        return unless @do_tags_index
        self.collection.master.map_reduce(TAGGABLE_MAP_FUNCTION, TAGGABLE_REDUCE_FUNCTION, out: tags_index_collection_name)
      end
    end

    def tags
      (tags_array || []).join(self.class.tags_separator)
    end

    def tags=(tags)
      self.tags_array = tags.split(self.class.tags_separator).map(&:strip).reject(&:blank?)
      @tags_array_changed = true
    end
  end
end
