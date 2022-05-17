require 'user'

describe User do
  describe '.create' do
    it 'adds a user to the database' do
      new_user = User.create(username: 'test_name')

      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.query("SELECT * FROM users WHERE username='test_name'")

      expect(new_user).to be_a User
      expect(new_user.username).to eq result.first['username']
      expect(new_user.id).to eq result.first['id']
    end
  end
end
