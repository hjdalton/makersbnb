feature 'allows a user to sign up' do 
  scenario 'navigate to signup page' do
    visit('/')
    fill_in('email', with: "test@test.com")
    fill_in('password1', with: "password")
    fill_in('password2', with: "password")
    click_button('Sign up')

    expect(page).to have_content("Book a Space")
  end
end
