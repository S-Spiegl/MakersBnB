require 'space'

describe Space do

  describe '.all' do
    it 'shows all spaces' do

      Space.create(name_of_space: 'Casa Spiegl', user_id: 1, description: 'Description_test', price_per_night: 1)
      Space.create(name_of_space: "Casa O'Neill", user_id: 1, description: 'Description_test', price_per_night: 1)
      spaces = Space.all
      expect(spaces.last.name_of_space).to eq "Casa O'Neill" 

    end
  end

  describe '.create' do

    it 'adds a space to the database' do

      Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: 1, description: 'Description_test', price_per_night: 1)
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec("SELECT * FROM spaces")
      expect(result[0]['name_of_space']).to include 'Casa Ramos Sanchez'

    end

  end

end
