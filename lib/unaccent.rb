require 'iconv'

module Unaccent
  module_function

  def converter
    @@converter ||= Iconv.new 'ASCII//TRANSLIT//IGNORE', 'UTF8'
  end

  def unaccent(word)
    converter.iconv(word).gsub(/[^\w]/, '')
  end

end
