feature 'allows a user to sign in' do
  scenario 'home page has a sign in button' do
    visit('/')
    click_link('Sign In')
    expect(page).to have_content "Email"
  end
end

feature 'refuses log in for incorrect details' do
  
end

feature 'accepts log in for correct details'
#write a test for incorrect log in details returning error
#write a test for correct log in details showing user log in 


# expect(current_path).to eq '/bookmarks'