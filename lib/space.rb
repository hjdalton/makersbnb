require 'pg'

class Space

  attr_reader :id, :space_name, :description, :price, :user_id

  def initialize(id:, space_name:, description:, price:, user_id:, email:)
    @id = id
    @space_name = space_name
    @description = description
    @price = price
  end



  def self.create(space_name:, description:, price:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO spaces (space_name, description, price, user_id) VALUES($1, $2, $3, (SELECT id FROM users WHERE email = '#{email}')) RETURNING id, space_name, description, price, user_id;", [space_name, description, price, user_id])
    Space.new(id: result[0]['id'], space_name: result[0]['space_name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['user_id'])
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec('SELECT * FROM spaces')
    result.map do |space|
      Space.new(
      id: space['id'],
      space_name: space['space_name'],
      description: space['description'],
      price: space['price']
      )
    end
  end

end
