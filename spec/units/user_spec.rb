require 'user'

describe User do
  describe '.all' do
    it 'creates a new user in the database' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users (email, password) VALUES ('test@test.com', 'password');")
      users = User.all
      expect(users).to include('test@test.com')
    end
  end

end