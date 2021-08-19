require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, spaces, bookings;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO users (email, password) VALUES ('test@test.com', 'password');")
  connection.exec("INSERT INTO users (email, password) VALUES ('test2@test.com', 'password');")
end

def add_space_to_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO spaces (space_name, description, price, user_id) VALUES ('test_space','Home of SH', 200, (SELECT id FROM users WHERE email = 'test@test.com'));")
end

def add_booking_to_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO bookings (space_id, user_id, start_date, end_date, status) 
  VALUES(
    (SELECT id FROM spaces WHERE id = 1),
    (SELECT id FROM users WHERE id = 2),
    '2020/08/19','2020/08/20','pending');" )
end
