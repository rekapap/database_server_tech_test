require_relative 'hash_wrapper.rb'
require_relative 'database_wrapper.rb'

# DB server
class DatabaseServer
  ERROR = 'No operations like that!'.freeze
  OK = 'I got it!'.freeze

  def initialize(wrapperclass: HashWrapper)
    @wrapper = wrapperclass.new
  end

  def call(env)
    uri = env['REQUEST_URI']
    p 'GET REQUEST: ' + uri
    handle_uri(uri)
  end

  def handle_uri(uri)
    return getkey_request_controller(uri) if uri[0..4] == '/get?'
    return setkey_request_controller(uri) if uri[0..4] == '/set?'
    return data_request_controller if uri[0..4] == '/data'

    send_response(ERROR)
  end

  def getkey_request_controller(uri)
    return end_response(ERROR) unless uri[5..8] == 'key='

    key = uri[9..-1]
    value = @wrapper.get(key: key)
    send_response(value)
  end

  def setkey_request_controller(uri)
    return send_response(ERROR) unless uri[5..-1].include?('=')

    hash = extract_keypair(uri)
    @wrapper.set(hash)
    send_response(OK)
  end

  def data_request_controller
    data = @wrapper.data
    send_response(data.to_s)
  end

  def send_response(body)
    [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
  end

  private

  def extract_keypair(uri)
    partitions = uri[5..-1].partition('=')
    key = partitions.delete_at(0)
    partitions.delete_at(0)
    value = partitions.join('')
    { key: key, value: value }
  end
end

run DatabaseServer.new(wrapperclass: DatabaseWrapper)

#  sanitize gem
#  edge cases:
#  - non exsisting keys for get
#  - exsisiting keys for set
#  controllers refactoring
#  routes extraction
