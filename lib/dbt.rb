
require 'highline/import'

module DBT
  autoload :Photo, 'dbt/photo.rb'
  autoload :Tag, 'dbt/tag.rb'
  
  def self.auth
    # # From here you are logged:
    # p auth.user
    @auth ||= flickr.auth.checkToken :auth_token => APP['auth_token']
  end
  
  def self.confirm(question)
    answer = ask(question) do |q|
      q.character = true
      q.validate = /^[yn]$/
      q.responses[:ask_on_error] = :question
      q.responses[:not_valid] = ''
    end
    answer == 'y'
  end
end