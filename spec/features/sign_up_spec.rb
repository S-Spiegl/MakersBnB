feature 'sign up' do 
  scenario 'a user can sign up' do 
    visit('/user/new')
    fill_in('username', with: 'new_user1')
    click_button('Submit')
    expect(current_path).to eq "/user"
    expect(page).to have_content "new_user1 logged in"    
  end 
end 



# So that I can use MakersBnB I want to be able to sign_up with an username