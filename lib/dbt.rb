
module DBT
  autoload :Photo, 'dbt/photo.rb'
  autoload :Tag, 'dbt/tag.rb'
  
  def self.auth
    # # From here you are logged:
    # p auth.user
    @auth ||= flickr.auth.checkToken :auth_token => APP['auth_token']
  end
end