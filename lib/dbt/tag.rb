#encoding: utf-8

class DBT::Tag
  BROKEN_CHARS = %w( ÿ ž ‘ )
  
  def self.find
    flickr.tags.getListUser['tags']
  end
  
  def self.confirm_broken
    @broken = self.find.select do |tag|
      print tag.ljust(32)
      if tag =~ /#{BROKEN_CHARS.join('|')}/
        DBT.confirm
      else
        puts 'ok'
        false
      end
    end
  end
  
  def self.confirmed_broken
    @broken
  end
  
  attr_reader :id
  attr_reader :content
  
  def initialize(tag)
    @id = tag['id']
    @content = tag['_content']
  end
  
  def broken?
    list_of_broken_tags.include?(@content)
  end
  
  def list_of_broken_tags
    self.class.instance_variable_get('@broken')
  end
end