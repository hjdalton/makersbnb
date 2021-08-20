feature 'allow a user to view details about a space' do
  scenario 'click on a listing' do
    visit('/spaces/new')
    fill_in('space_name', with: 'Hotel Alpha')
    fill_in('description', with: 'new place near centre')
    fill_in('price', with: '150')
    fill_in('start_date', with: '2022-01-01')
    fill_in('end_date', with: '2022-12-25')
    click_button('Submit')
    click_link ('Hotel Alpha')
    expect(page).to have_content ("Hotel Alpha")
    expect(page).to have_content ("new place near centre")
    expect(page).to have_content ("150")
    expect(page).to have_content("2022-01-01 to 2022-12-25")
  end
end
