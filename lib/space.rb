require 'pg'

class Space

  attr_reader :id, :space_name, :description, :price, :current_user

  def initialize(id:, space_name:, description:, price:, current_user:)
    @id = id
    @space_name = space_name
    @description = description
    @price = price
    @current_user = current_user
  end



  def self.create(space_name:, description:, price:, current_user:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO spaces (space_name, description, price, user_id) VALUES($1, $2, $3, (SELECT id FROM users WHERE email = $4)) RETURNING id, space_name, description, price, user_id;", [space_name, description, price, current_user])
    Space.new(id: result[0]['id'], space_name: result[0]['space_name'], 
      description: result[0]['description'], price: result[0]['price'], 
      current_user: result[0]['user_id'])
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
      price: space['price'],
      current_user: space['user_id']
      )
    end
  end

end
