require 'pg'

class Space

  attr_reader :id, :name_of_space, :available, :user_id

  def initialize(id:, name_of_space:, available:)
    @id = id
    @name_of_space = name_of_space
    @available = change_into_boolean(available) #returning from database is either 't' or 'f'. this changes that into boolean
    @user_id = user_id
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(id: space['id'], name_of_space: space['name_of_space'], available: space['available'])
    end
  end

  def self.create(name_of_space:, available: 1, user_id: 1 )
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec_params(
      "INSERT INTO spaces (name_of_space, available, user_id) VALUES($1, $2, $3) RETURNING id, name_of_space, user_id;", 
      [name_of_space, available, user_id]
    )
    Space.new(id: result[0]['id'], name_of_space: result[0]['name_of_space'], available: result[0]['available'])
  end
  
  def self.find_by_user(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec_params("SELECT * FROM spaces WHERE user_id = ($1);",[id])
    result.map do |space|
      Space.new(id: space['id'], name_of_space: space['name_of_space'], available: space['available'])
    end
  end 

  def self.find(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  
    space = connection.exec_params("SELECT * FROM spaces WHERE id = ($1);",[id])
    Space.new(id: space[0]['id'], name_of_space: space[0]['name_of_space'], available: space[0]['available'])
  end 
  
  def change_into_boolean(letter)
    return true if letter == 't'
    false
  end

end
