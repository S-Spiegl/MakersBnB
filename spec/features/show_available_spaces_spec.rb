feature 'show available spaces' do

  scenario 'only available spaces are on the list' do

    Space.create(name_of_space: 'Casa Ramos Sanchez',user_id: 1, description: 'Description_test', price_per_night: 1)
    Space.create(name_of_space: 'Casa Spiegl', available: 0, user_id: 1, description: 'Description_test', price_per_night: 1 )
    visit '/spaces'
    expect(page).to have_content 'Casa Ramos Sanchez'
    expect(page).not_to have_content 'Casa Spiegl'

  end

end
