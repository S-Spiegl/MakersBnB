class Request

  attr_reader :space_id, :sender_id, :message, :status

  def initialize(space_id:, sender_id:, status:, message:)
    @space_id = space_id
    @sender_id = sender_id
    @status = status
    @message = message
  end

  def self.create(space_id:, sender_id:, message:, status: 'pending')
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec_params(
      "INSERT INTO requests (space_id, sender_id, message, status) VALUES($1, $2, $3, $4) RETURNING space_id, sender_id, message, status;",
    [space_id, sender_id, message, status])
    Request.new(space_id: result[0]['space_id'], sender_id: result[0]['sender_id'], message: result[0]['message'], status: result[0]['status'])
  end
end
