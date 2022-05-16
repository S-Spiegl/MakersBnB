require 'space'

describe Space do

  describe '.create' do

    it 'adds a space to the database' do

      Space.create(name_of_space: 'Casa Ramos Sanchez')
      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.exec("SELECT * FROM spaces")
      expect(result[0]['name_of_space']).to include 'Casa Ramos Sanchez'

    end

  end

end