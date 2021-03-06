#encoding: utf-8

class DBT::Tag
  def self.find
    flickr.tags.getListUser['tags']
  end
  
  def self.confirm_broken
    @broken = self.find.select do |tag|
      yield tag
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
    broken_tags.include?(@content)
  end
  
  def broken_tags
    self.class.confirmed_broken
    # self.class.instance_variable_get('@broken')
  end
end