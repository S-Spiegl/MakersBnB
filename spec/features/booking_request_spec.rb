feature 'making a request' do
  scenario 'sends a request to the owner/host' do

    result = User.create(username:'Eóin')
    user_id = result.id


    space = Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: user_id, description: 'Description_test', price_per_night: 1 )
  
		visit '/spaces'
    first('.space').click_button 'request'
    expect(current_path).to eq "/spaces/request/#{space.id}"
		fill_in 'message', with: 'kaixo, Erlantz'
		click_button 'send'
    expect(current_path).to eq '/spaces'
    connection = PG.connect(dbname: 'makersbnb_test')
    result = connection.exec('SELECT * FROM requests')
    expect(result.first['space_id']).to eq space.id
    expect(result.first['message']).to eq 'kaixo, Erlantz'
    expect(result.first['status']).to eq 'pending'


  end
end
