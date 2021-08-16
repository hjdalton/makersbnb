require 'pg'

class User
 attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
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

end