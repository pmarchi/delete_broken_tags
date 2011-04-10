
require 'bundler/setup'
require 'flickraw'

BASE = File.expand_path(File.dirname(__FILE__) + '/../')

#----------------------------------------------------------- load access token
AUTH_TOKEN = File.read(File.join(BASE, 'conf/token')).strip


FlickRaw.api_key = '9534990f11afeac7ca25651966ae9f69'
FlickRaw.shared_secret = 'd1f2b7fb91c5e943'
