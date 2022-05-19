require 'request'
require 'pg'

describe Request do
  describe '.create' do
    it 'adds a request to the database' do
      request = Request.create(space_id: 1, sender_id: 2, message: 'hi')
      Request.create(space_id: 2, sender_id: 3, message: 'hi')
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec('SELECT * FROM requests')
      expect(request).to be_a Request
      expect(request.space_id).to eq result.first['space_id']
      expect(request.sender_id).to eq result.first['sender_id']
    end
  end
end
