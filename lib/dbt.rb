
module DBT
  autoload :Photo, 'dbt/photo.rb'
  autoload :Tag, 'dbt/tag.rb'
  
  class TagHasNoId < RuntimeError; end
  
  def self.auth
    # # From here you are logged:
    # p auth.user
    @auth ||= flickr.auth.checkToken :auth_token => APP['auth_token']
  end
  
  def self.confirm
    answer = ask("broken? ") do |q|
      q.character = true
      q.validate = /^[yn]$/
      q.responses[:ask_on_error] = :question
      q.responses[:not_valid] = ''
    end
    answer == 'y'
  end
end