require 'pg'

class Space

  attr_reader :id, :space_name, :description, :price, :current_user, :start_date, :end_date

  def initialize(id:, space_name:, description:, price:, current_user:, start_date:, end_date:)
    @id = id
    @space_name = space_name
    @description = description
    @price = price
    @current_user = current_user
    @start_date = start_date
    @end_date = end_date
  end



  def self.create(space_name:, description:, price:, current_user:, start_date:, end_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO spaces (space_name, description, price, user_id, start_date, end_date) VALUES($1, $2, $3, (SELECT id FROM users WHERE email = $4), $5, $6) RETURNING id, space_name, description, price, user_id, start_date, end_date;", [space_name, description, price, current_user, start_date, end_date])
    Space.new(id: result[0]['id'], space_name: result[0]['space_name'], description: result[0]['description'], price: result[0]['price'], current_user: result[0]['user_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'])
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
      current_user: space['user_id'],
      start_date: space['start_date'],
      end_date: space['end_date']
      )
    end
  end

end
