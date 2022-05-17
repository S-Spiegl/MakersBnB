feature 'adding new spaces' do
  
  scenario 'user adds a new space' do

    visit '/spaces/add'
    fill_in 'name_of_space', with: 'Casa Ramos Sanchez'
    click_button 'Add Space'

    expect(current_path).to eq '/spaces'
    expect(page).to have_content 'Casa Ramos Sanchez'

  end
end