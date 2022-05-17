require 'pg'

class User

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec_params("INSERT INTO users (username) VALUES($1) RETURNING id, username ;", [username])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.authenticate(username:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec_params("SELECT * FROM users WHERE username = $1", [username])
    if result.any?
      User.new(id: result[0]['id'], username: result[0]['username'])
    else
      nil
    end
  end

end