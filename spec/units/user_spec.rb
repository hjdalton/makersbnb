require 'user'

describe User do
  describe '.all' do
    it 'shows all users in the database' do
      users = User.all
      expect(users).to include('test@test.com')
    end
  end

  describe '.create' do
    it 'adds the user credentials to the database' do
      User.create(email: 'test2@test.com', password: 'password')
      expect(User.all).to include("test2@test.com")
    end
  end
end