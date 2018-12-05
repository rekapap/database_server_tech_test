require './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('db_server_test')
else
  DatabaseConnection.setup('db_server')
end
