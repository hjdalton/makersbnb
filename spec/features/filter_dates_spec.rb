feature 'Filtering dates' do
  scenario 'Filter dates to the ones I want to see' do
    visit('/spaces/new')
    fill_in('space_name', with: 'Hotel Alpha')
    fill_in('description', with: 'new place near centre')
    fill_in('price', with: '150')
    fill_in('start_date', with: '2022-01-01')
    fill_in('end_date', with: '2022-12-25')
    click_button('Submit')
    visit('/spaces/new')
    fill_in('space_name', with: 'Hotel Bravo')
    fill_in('description', with: 'old place far from centre')
    fill_in('price', with: '300')
    fill_in('start_date', with: '2022-01-01')
    fill_in('end_date', with: '2022-02-01')
    click_button('Submit')
    fill_in('start_date', with: '2022-03-01')
    fill_in('end_date', with: '2022-03-02')
  end
end
