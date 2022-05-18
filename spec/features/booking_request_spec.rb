feature 'making a request' do
  scenario 'sends a request to the owner/host' do

    result = User.create(username:'Eóin')
    user_id = result.id


    space = Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: user_id )
    # space = double('Space', name_of_space: 'Casa Ramos Sanchez')

    # need to add user_id key to create method in user.rb
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

		# visit '/login/user'
    # expect(page).to have_content "Your space #{space.name_of_space} has received a booking request from #{user_id}"
		# expect(page).to have_content 'test_message'

  end
end
