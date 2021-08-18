require 'space'
require 'database_helpers'

describe Space do
  describe "#all" do
    it "returns all spaces" do
      space = Space.create(space_name: '123 Baker Street', description: 'Home of SH', price: '200')
      Space.create(space_name: '124 Baker Street', description: 'Next to home of SH', price: '150')
      Space.create(space_name: '125 Baker Street', description: 'Close to home of SH', price: '100')

      spaces = Space.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Space
      expect(spaces.first.id).to eq space.id
      expect(spaces.first.space_name).to eq '123 Baker Street'
      expect(spaces.first.description).to eq 'Home of SH'
      expect(spaces.first.price).to eq '200'
    end
  end

  describe '.create' do
    it 'adds the space credentials to the database' do
      space = Space.create(space_name: 'Hotel Alpha', description: 'new place near centre', price: '150')
      persisted_data = persisted_data(id: space.id)
      expect(space.space_name).to eq("Hotel Alpha")
    end
  end
end
