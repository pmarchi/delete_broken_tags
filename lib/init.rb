
require 'bundler/setup'
require 'flickraw'
require 'yaml'

BASE = File.expand_path(File.dirname(__FILE__) + '/../')

#---------------------------------- load api_key, shared_secret and auth_token
APP = YAML.load_file(File.join(BASE, 'config/app.yml'))

FlickRaw.api_key = APP['api_key']
FlickRaw.shared_secret = APP['shared_secret']
