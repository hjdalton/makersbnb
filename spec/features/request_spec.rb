feature 'viewing all user requests' do
  scenario 'page shows ' do
    visit('/spaces')
    click_button("Book")
    click_button('Request Booking')
    expect(current_path).to eq('/requests')
    expect(page).to have_content('booking requested')


  end
end