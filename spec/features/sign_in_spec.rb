feature 'allows a user to sign in' do
  scenario 'home page has a sign in button' do
    visit('/')
    click_link('Sign In')
    expect(current_path).to eq '/sign_in'
  end
end

feature 'refuses log in for incorrect details' do
  scenario 'error is raised when user gives incorrect log in details' do
    visit('/')
    click_link('Sign In')
    fill_in('email', with: "wrongemail@error.com")
    fill_in('password', with: "randompassword")
    click_button('Sign in')

    #expect(page).to have_content('Unknown User')
  end
end

feature 'accepts log in for correct details' do
  scenario 'user is logged in' do
    visit('/')
    click_link('Sign In')
    fill_in('email', with: "test@test.com")
    fill_in('password', with: "password")
    click_button('Sign in')

    #expect(page).to #????
  end
end
#write a test for incorrect log in details returning error
#write a test for correct log in details showing user log in


# expect(current_path).to eq '/bookmarks'
