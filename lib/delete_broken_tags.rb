#encoding: utf-8

class DeleteBrokenTags
  def initialize
  end
  
  def broken_tags
    b = tags.reject do |tag|
      tag =~ /^[A-Za-z0-9äöü]+$/
    end
    p b
  end
  
  def tags
    # From here you are logged:
    p auth.user
    
    t = flickr.tags.getListUser :user_id => auth.user['nsid']
    p t
    t['tags']
  end

  def auth
    @auth ||= flickr.auth.checkToken :auth_token => auth_token
  end
  
  def auth_token
    AUTH_TOKEN
  end
  
  class FirstTimeAuth
    def request_access
      frob = flickr.auth.getFrob
      auth_url = FlickRaw.auth_url :frob => frob, :perms => 'read'

      puts "Open this url in your process to complete the authication process : #{auth_url}"
      puts "Press Enter when you are finished."
      STDIN.getc

      begin
        auth = flickr.auth.getToken :frob => frob
        login = flickr.test.login
        puts "You are now authenticated as #{login.username} with token #{auth.token}"
      rescue FlickRaw::FailedResponse => e
        puts "Authentication failed : #{e.msg}"
      end
    end
  end
end