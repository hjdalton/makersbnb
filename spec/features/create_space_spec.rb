# As a homeowner So that I can list a space I have. I would like to be able to create a space to book.
feature "creating space" do
  scenario "user can create a new space" do
    visit('/spaces/new')
    fill_in('space_name', with: 'Hotel Alpha')
    click_button('Submit')
    expect(page).to have_content ("Hotel Alpha")
  end
end
