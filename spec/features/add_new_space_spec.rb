feature 'adding new spaces' do
  
  scenario 'user adds a new space and information is printed both in spaces and user page' do

    host = User.create(username:'Eóin')
    host_id = host.id

    visit("/sessions/new")
    fill_in(:username, with: 'Eóin')
    click_button('Log in')

    visit '/spaces/add'
    fill_in 'name_of_space', with: 'Casa Ramos Sanchez'
    fill_in 'description', with: 'A nice villa in Marbella, Spain'
    fill_in 'price_per_night', with: '200'

    click_button 'Add Space'

    expect(current_path).to eq '/spaces'
    expect(page).to have_content 'Casa Ramos Sanchez'
    expect(page).to have_content 'Description: A nice villa in Marbella, Spain'
    expect(page).to have_content 'Price per night: £200'

    click_button 'User Page'

    expect(current_path).to eq '/user'
    expect(page).to have_content 'Casa Ramos Sanchez'
    expect(page).to have_content 'Description: A nice villa in Marbella, Spain'
    expect(page).to have_content 'Price per night: £200'
  
  end
end
