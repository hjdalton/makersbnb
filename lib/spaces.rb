require 'pg'

class Space
  
  attr_reader :id, :space_name, :description, :price
  
  def initialize(id:, space_name:, description:, price:)
    @id = id
    @space_name = space_name
    @description = description
    @price = price
  end
  
  def self.create(space_name:, description:, price:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO spaces (space_name, description, price) VALUES($1, $2, $3)RETURNING id, space_name, description, price;", [space_name, description, price])
    Space.new(id: result[0]['id'], space_name: result[0]['space_name'], description: result[0]['description'], price: result[0]['price'])
  end
  
  def self.all
    if ENV['ENVIROMENT'] == 'test'
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