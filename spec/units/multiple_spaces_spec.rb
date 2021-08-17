
describe Space do
  describe 'multiple spaces per user' do
    it 'allows user to add multiple spaces' do
      Space.create(space_name: "Hotel Alpha")
      Space.create(space_name: "Hotel Bravo")
      expect(Space.all).to include("Hotel Alpha")
      expect(Space.all).to include("Hotel Bravo")
    end
  end
end
