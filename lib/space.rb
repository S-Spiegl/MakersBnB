class Space

  def self.create(name_of_space:)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec_params("INSERT INTO spaces (name_of_space) VALUES($1) RETURNING id, name_of_space ;", [name_of_space])

  end


end