require 'sinatra/base'
require 'uri'

# DatabaseServer class
class DatabaseServer < Sinatra::Base
  set :port, 4000
  get '/' do
    'Welcome to DatabaseServer!'
  end

  run! if app_file == $PROGRAM_NAME
end
