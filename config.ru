require 'geminabox'

Geminabox.allow_replace = !!ENV['ALLOW_REPLACE']
Geminabox.data = '/app/data'
Geminabox.build_legacy = false

username = ENV['BASIC_AUTH_USERNAME']
password = ENV['BASIC_AUTH_PASSWORD']
if username && password
  use Rack::Auth::Basic do |username, password|
    username == username && password == password
  end
end

run Geminabox::Server
