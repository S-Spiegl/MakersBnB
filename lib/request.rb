class Request

  attr_reader :space_name, :space_id, :sender_id

  def initialize(space_name:, space_id:, sender_id:)
    @space_name = space_name
    @space_id = space_id
    @sender_id = sender_id
  end

  def self.create(space_name:, space_id:, sender_id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec_params("INSERT INTO requests (space_name, space_id, sender_id) VALUES($1, $2, $3) RETURNING space_name, space_id, sender_id;", [space_name, space_id, sender_id])
  end
end
