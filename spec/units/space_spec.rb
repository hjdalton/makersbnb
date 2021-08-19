require 'space'
require 'database_helpers'

describe Space do
  describe "#all" do
    it "returns all spaces" do
      Space.create(space_name: '123 Baker Street', description: 'Home of SH', price: '200', current_user: "testing@test.com", start_date: "01/01/2022", end_date: "2022-12-25")
      Space.create(space_name: '124 Baker Street', description: 'Next to home of SH', price: '150', current_user: "testing@test.com", start_date: "01/01/2022", end_date: "2022-12-25")
      space = Space.create(space_name: '125 Baker Street', description: 'Close to home of SH', price: '100', current_user: "testing@test.com", start_date: "01/01/2022", end_date: "2022-12-25")

      spaces = Space.all

      expect(spaces.length).to eq 4
      expect(spaces.last).to be_a Space
      expect(spaces.last.id).to eq space.id
      expect(spaces.last.space_name).to eq '125 Baker Street'
      expect(spaces.last.description).to eq 'Close to home of SH'
      expect(spaces.last.price).to eq '100'
    end
  end

  describe '.create' do
    it 'adds the space credentials to the database' do
      space = Space.create(space_name: 'Hotel Alpha', description: 'new place near centre', price: '150', current_user: "testing@test.com", start_date: "01/01/2022", end_date: "2022-12-25")
      persisted_data = persisted_data(id: space.id)
      expect(space.space_name).to eq("Hotel Alpha")
    end
  end
end
