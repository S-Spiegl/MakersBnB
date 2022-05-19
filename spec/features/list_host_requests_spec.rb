feature 'list host request' do
  scenario 'displays all the host requests in one place and their staus' do 
    host = User.create(username:'Eóin')
    host_id = host.id
    space = Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: host_id )
    space_id = space.id 
    name_of_space = space.name_of_space
    guest = User.create(username:'Jimmy')
    guest_id = guest.id
    
    Request.create(space_id: space_id , sender_id: guest_id , message: "I'd like to book")
    
    visit("/sessions/new")
    fill_in(:username, with: 'Eóin')
    click_button('Log in')
    click_button('User Page')

    expect(page).to have_content "Jimmy has requested to book #{name_of_space}"
    expect(page).to have_content "I'd like to book"
    expect(page).to have_content "pending"
  end 
end