
class DBT::Photo
  
  def self.find
    flickr.people.getPhotos(:user_id => 'me').map do |photo|
      self.new(photo)
    end
  end

  attr_reader :id
  
  def initialize(photo)
    @id = photo['id']
  end
  
  def tags
    @tags ||= flickr.tags.getListPhoto(:photo_id => id)['tags'].map do |tag|
      DBT::Tag.new(tag)
    end
  end
  
  def delete_tag(tag)
    flickr.photos.removeTag(:photo_id => id, :tag_id => tag.id)
    @tags = nil
  end
end