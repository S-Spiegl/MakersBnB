feature 'List of users added spaces' do
  scenario "When a user visits their 'User page', it displays a list of their added properties" do
    new_user = User.create(username: 'test_name')
    second_user_id = new_user.id.to_i + 1
    Space.create(name_of_space: 'random name', user_id: second_user_id)
    Space.create(name_of_space: 'another random name', user_id: second_user_id)
    visit '/sessions/new'
    fill_in(:username, with: 'test_name')
    click_button 'Log in'
    
    expect(current_path).to eq '/spaces'

    click_button 'Add new space'
    fill_in 'name_of_space', with: 'Flat iron building'
    click_button 'Add Space'
    click_button 'User Page'

    expect(current_path).to eq '/user'
    expect(page).to have_content 'Flat iron building'
    expect(page).not_to have_content 'random name'
    expect(page).not_to have_content 'another random name'
  end
end
