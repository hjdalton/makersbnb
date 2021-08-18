feature 'user requests to book a space' do
  scenario 'user clicks request on a space listing' do
    visit('/spaces')
    click_link('Space 1')
    expect(current_path).to eq '/space/1'
  end
end