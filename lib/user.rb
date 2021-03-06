require 'pg'

class User
 attr_reader :email, :password

  def initialize(email:, password:, id:)
    @email = email
    @password = password
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users;")
    result.map { |email| email['email'] }
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}');")
  end

  def self.sign_in(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM users WHERE email LIKE '#{email}' AND password LIKE '#{password}';")
    result = result.map { |user_id| user_id['id'] }
    return 'Unknown User' if result == []
    return result.first

  end
end
