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

  describe '.authenticate' do

    it 'user is authenticated if in database and returns nil if not' do

      User.create(username: 'test_name')
      user = User.authenticate(username: 'test_name')

      expect(user.username).to eq 'test_name'

      not_user = User.authenticate(username: 'not_a_user')

      expect(not_user).to eq nil

    end

  end

  describe '.find' do

    it 'user can be found by its id' do

      user = User.create(username: 'test_name')
      found_user = User.find(id: user.id)
      expect(found_user.username).to eq 'test_name'

    end

  end
end
