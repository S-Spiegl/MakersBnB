require 'pg'

class Space

  attr_reader :id, :name_of_space, :available, :user_id, :description, :price_per_night

  def initialize(id:, name_of_space:, user_id:, available:, description:, price_per_night:)
    @id = id
    @name_of_space = name_of_space
    @available = change_into_boolean(available) #returning from database is either 't' or 'f'. this changes that into boolean
    @user_id = user_id
    @description = description
    @price_per_night = price_per_night
  end

  def self.all

    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(id: space['id'], user_id: space['user_id'], name_of_space: space['name_of_space'], available: space['available'], description: space['description'], price_per_night: space['price_per_night'])
    end
  end

  def self.create(name_of_space:, available: 1, user_id:, description: "", price_per_night: 1)

    result = DatabaseConnection.query(
      "INSERT INTO spaces (name_of_space, available, user_id, description, price_per_night) VALUES($1, $2, $3, $4, $5) RETURNING id, name_of_space, user_id, available, description, price_per_night;", 
      [name_of_space, available, user_id, description, price_per_night]
    )
    Space.new(id: result[0]['id'], name_of_space: result[0]['name_of_space'], user_id: result[0]['user_id'], available: result[0]['available'], description: result[0]['description'], price_per_night: result[0]['price_per_night'])
  end
  
  def self.find_by_user(id:)

    result = DatabaseConnection.query("SELECT * FROM spaces WHERE user_id = ($1);",[id])
    result.map do |space|
      Space.new(id: space['id'], user_id: space['user_id'], name_of_space: space['name_of_space'], available: space['available'], description: space['description'], price_per_night: space['price_per_night'])
    end
  end 

  def self.find(id:)
  
    space = DatabaseConnection.query("SELECT * FROM spaces WHERE id = ($1);",[id])
    Space.new(id: space[0]['id'], user_id: space[0]['user_id'], name_of_space: space[0]['name_of_space'], available: space[0]['available'], description: space[0]['description'], price_per_night: space[0]['price_per_night'])
  end 
  
  def change_into_boolean(letter)
    return true if letter == 't'
    false
  end

end
