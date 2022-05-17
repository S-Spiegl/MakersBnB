require 'pg'

def set_up_test_database

  p 'Setting up test database'

  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec('TRUNCATE spaces, users;')

end
