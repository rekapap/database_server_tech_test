require 'sinatra/base'
require 'uri'
require_relative 'lib/hash_wrapper'
require_relative 'lib/params_validator'

# DatabaseServer class
class DatabaseServer < Sinatra::Base
  set :port, 4000

  def initialize(paramsvalidator_class = ParamsValidator, wrapper_class = HashWrapper)
    super()
    @params_validator = paramsvalidator_class
    @wrapper = wrapper_class.new
  end

  get '/' do
    'Welcome to DatabaseServer!'
  end

  get '/set' do
    p params
    result = @params_validator.validate(params)
    return 'Invalid parameters' unless result

    @wrapper.set(result)
    "I wrote '#{result}' into the datastore"
  end

  run! if app_file == $PROGRAM_NAME
end
