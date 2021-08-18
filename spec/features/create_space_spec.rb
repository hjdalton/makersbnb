# As a homeowner So that I can list a space I have. I would like to be able to create a space to book.
feature "creating space" do
  scenario "user can create a new space" do
    visit('/spaces/new')
    fill_in('space_name', with: 'Hotel Alpha')
    fill_in('description', with: 'new place near centre')
    fill_in('price', with: '150')
    fill_in('start_date', with: '2022-01-01')
    fill_in('end_date', with: '2022-12-25')
    click_button('Submit')
    expect(page).to have_content ("Hotel Alpha")
    expect(page).to have_content ("new place near centre")
    expect(page).to have_content ("150")
    expect(page).to have_content("Available from 2022-01-01 to 2022-12-25")
  end
end