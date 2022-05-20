feature 'list host request' do
  scenario 'displays all the host requests in one place and their staus' do 
    host = User.create(username:'Eóin')
    host_id = host.id
    space = Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: host_id, description: 'Description_test', price_per_night: 1 )
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

  scenario 'displays multiple host requests' do 
    host = User.create(username:'Eóin')
    host_id = host.id
    space_1 = Space.create(name_of_space: 'Casa Ramos Sanchez', user_id: host_id, description: 'Description_test', price_per_night: 1 )
    space_id_1 = space_1.id 
    name_of_space_1 = space_1.name_of_space
    space_2 = Space.create(name_of_space: 'Haus Ramos Sanchez', user_id: host_id, description: 'Description_test', price_per_night: 1 )
    space_id_2 = space_2.id 
    name_of_space_2 = space_2.name_of_space

    guest_1 = User.create(username:'Jimmy')
    guest_id_1 = guest_1.id
    guest_2 = User.create(username:'Kieran')
    guest_id_2 = guest_2.id
    
    Request.create(space_id: space_id_1 , sender_id: guest_id_1 , message: "I'd like to book")
    Request.create(space_id: space_id_1 , sender_id: guest_id_2 , message: "I'd like to book")
    Request.create(space_id: space_id_2 , sender_id: guest_id_1 , message: "I'd like to book")
    Request.create(space_id: space_id_2 , sender_id: guest_id_2 , message: "I'd like to book")
    
    visit("/sessions/new")
    fill_in(:username, with: 'Eóin')
    click_button('Log in')
    click_button('User Page')

    expect(page).to have_content "Jimmy has requested to book #{name_of_space_1}"
    expect(page).to have_content "I'd like to book"
    expect(page).to have_content "pending"

    expect(page).to have_content "Jimmy has requested to book #{name_of_space_2}"
    expect(page).to have_content "I'd like to book"
    expect(page).to have_content "pending"

    expect(page).to have_content "Kieran has requested to book #{name_of_space_1}"
    expect(page).to have_content "I'd like to book"
    expect(page).to have_content "pending"

    expect(page).to have_content "Kieran has requested to book #{name_of_space_2}"
    expect(page).to have_content "I'd like to book"
    expect(page).to have_content "pending"
  end 
end