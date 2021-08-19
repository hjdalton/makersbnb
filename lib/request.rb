require 'pg'

class Request

  attr_reader :id, :space_id, :user_id, :start_date, :end_date, :status, :space_name

  def initialize(id:, space_id:, user_id:, start_date:, end_date:, status:, space_name:)
    @id = id
    @space_id = space_id
    @user_id = user_id
    @start_date = start_date
    @end_date = end_date
    @status = status
    @space_name = space_name
  end

  
  def self.made(user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec(
      "SELECT bookings.id, space_id, bookings.user_id, spaces.space_name, start_date, end_date, status
      FROM bookings 
      JOIN spaces ON bookings.space_id = spaces.id 
      WHERE bookings.user_id = #{user_id}")
    
    Request.new(id: result[0]['id'],space_id: result[0]['space_id'], 
      space_name: result[0]['spaces.space_name'],user_id: result[0]['booking.user_id'], 
      start_date: result[0]['start_date'], end_date: result[0]['end_date'], 
      status: result[0]['status'])
  end

  def self.received(user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec(
      "SELECT bookings.id, space_id, spaces.user_id, space_name, start_date, end_date, status FROM bookings 
      JOIN spaces ON bookings.space_id = spaces.id 
      WHERE spaces.user_id = #{user_id};")
    result.map do |received|
      Request.new(
        id: received['id'],
        space_id: received['space_id'],
        space_name: received['space_name'],
        start_date: received['start_date'],
        end_date: received['end_date'],
        status: received['status'],
        user_id: received['user_id']
      )
    end
  end

end




