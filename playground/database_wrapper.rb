require_relative './database_connection'

class DatabaseWrapper

  def initialize
    @databaseconnection = DatabaseConnection.setup('db_server')
  end

  def set(key:, value:)
    # exsisting keys?
    DatabaseConnection.query("INSERT INTO data (key, value) VALUES('#{key}', '#{value}');")
  end

  def get(key:)
    # non exsisting keys?
    result = DatabaseConnection.query("SELECT * FROM data WHERE key = '#{key}'").first
    result['value']
  end

  def data
    result = DatabaseConnection.query("SELECT * FROM data")
    data_maker(result)
  end

  private

  def data_maker(data)
    dictionary = {}
    data.each do |pair|
      dictionary[pair['key']] = pair['value']
    end
    dictionary
  end
end
