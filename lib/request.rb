require 'pg'

class Request

  attr_reader :id, :space_id, :current_user, :start_date, :end_date, :status, :space_name

  def initialize(id:, space_id:, current_user:, start_date:, end_date:, status:, space_name:)
    @id = id
    @space_id = space_id
    @current_user = current_user
    @start_date = start_date
    @end_date = end_date
    @status = status
    @space_name = space_name
  end


  def self.made(current_user:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT bookings.id, space_id, bookings.user_id, space_name, bookings.start_date, bookings.end_date, status FROM bookings
      JOIN spaces ON bookings.space_id = spaces.id
      WHERE bookings.user_id = '#{current_user}';")

      result.map do |made|
      Request.new(
        id: made['id'],
        space_id: made['space_id'],
        space_name: made['space_name'],
        start_date: made['start_date'],
        end_date: made['end_date'],
        status: made['status'],
        current_user: made['user_id']
      )
    end
  end

  def self.received(current_user:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec(
      "SELECT bookings.id, space_id, spaces.user_id, space_name, bookings.start_date, bookings.end_date, status FROM bookings
      JOIN spaces ON bookings.space_id = spaces.id
      WHERE spaces.user_id = '#{current_user}';")
    result.map do |received|
      Request.new(
        id: received['id'],
        space_id: received['space_id'],
        space_name: received['space_name'],
        start_date: received['start_date'],
        end_date: received['end_date'],
        status: received['status'],
        current_user: received['user_id']
      )
    end
  end

end
