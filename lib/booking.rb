require 'pg'

class Booking

  attr_reader :id, :space_id, :user_id, :start_date, :end_date, :status

  def initialize(id:, space_id:, user_id:, start_date:, end_date:, status:)
    @id = id
    @space_id = space_id
    @user_id = user_id
    @start_date = start_date
    @end_date = end_date
    @status = status
  end

  
  def self.create(space_id:, user_id:, start_date:, end_date:, status:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec(
      "INSERT INTO bookings (space_id, user_id, start_date, end_date, status) 
      VALUES (
      (SELECT id FROM spaces WHERE id = $1 ),
      (SELECT id FROM users WHERE id = $2),
      $3, $4, 'pending') 
      RETURNING id, space_id, user_id, start_date, end_date, status;", 
      [space_id, user_id, start_date, end_date])
    
    Booking.new(id: result[0]['id'],space_id: result[0]['space_id'], user_id: result[0]['user_id'], 
      start_date: result[0]['start_date'], end_date: result[0]['end_date'], status: result[0]['status'])
  end

  def self.accept(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec(
      "UPDATE bookings
      SET status = 'accepted'
      WHERE id = #{id} 
      RETURNING id;" 
      )
      result = result.map { |booking_id| booking_id['id'] }
      return result.first
  end

  def self.reject(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec(
      "UPDATE bookings
      SET status = 'rejected'
      WHERE id = #{id} 
      RETURNING id;" 
      )
      result = result.map { |booking_id| booking_id['id'] }
      return result.first
  end
end
