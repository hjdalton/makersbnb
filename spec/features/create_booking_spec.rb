feature 'user makes booking on a space' do
  scenario 'booking is requested ' do
    visit('/sign_in')
    fill_in('email', with: "test@test.com")
    fill_in('password', with: "password")
    click_button('Sign in')
    click_link ('test_space')
    click_button('Book!')
    expect(current_path).to eq('/requests')
    expect(page).to have_content('test_space')


  end
end