feature 'list request as guest' do
  scenario 'displays all the requests the user has sent as guest in one place and their status' do 
    host = User.create(username:'Eóin')
    host_id = host.id
    space = Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: host_id, description: 'Description_test', price_per_night: 1 )
    space_id = space.id 
    name_of_space = space.name_of_space
    guest = User.create(username:'Jimmy')
    guest_id = guest.id
    
    Request.create(space_id: space_id , sender_id: guest_id , message: "I'd like to book")
    
    visit("/sessions/new")
    fill_in(:username, with: 'Jimmy')
    click_button('Log in')
    click_button('User Page')

    expect(page).to have_content "You have requested to book #{name_of_space}"
    expect(page).to have_content "I'd like to book"
    expect(page).to have_content "pending"
  end
end