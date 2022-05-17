require 'pg'

class Space

  attr_reader :id, :name_of_space

  def initialize(id:, name_of_space:)
    @id = id
    @name_of_space = name_of_space
  end

  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(id: space['id'], name_of_space: space['name_of_space'])
    end
  end


  def self.create(name_of_space:)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec_params("INSERT INTO spaces (name_of_space) VALUES($1) RETURNING id, name_of_space ;", [name_of_space])

  end


end
