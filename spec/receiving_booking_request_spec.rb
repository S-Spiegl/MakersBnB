require 'request'
require 'pg'

describe Request do
  describe '.create' do
    it 'adds a request to the database' do
      request = Request.create(space_name: 'Casa Carty', space_id: 1, sender_id: 2)
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec_params("INSERT INTO requests (space_name, space_id, sender_id) VALUES($1, $2, $3) RETURNING space_name, space_id, sender_id;", [space_name, space_id, sender_id])
      expect(request).to be_a Request
      expect(request.space_name).to eq 'Casa Carty'
      expect(request.space_id).to eq result.first['space']
      expect(request.sender_id).to eq result.first['sender']
    end
  end
end
