require 'spaces'

describe Space do
  describe '.all' do
    it 'shows all spaces in the database' do
      spaces = Space.all
      expect(spaces).to include('test_space')
    end
  end

  describe '.create' do
    it 'creates a new space in the database' do
      Space.create(space_name: "space_test", email: "test@test.com")
      expect(Space.all).to include("space_test")
    end
  end
end