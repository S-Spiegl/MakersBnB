feature 'show available spaces' do

  scenario 'only available spaces are on the list' do

    Space.create(name_of_space: 'Casa Ramos Sanchez')
    Space.create(name_of_space: 'Casa Spiegl', available: 0 )
    visit '/spaces'
    expect(page).to have_content 'Casa Ramos Sanchez'
    expect(page).not_to have_content 'Casa Spiegl'

  end

end
