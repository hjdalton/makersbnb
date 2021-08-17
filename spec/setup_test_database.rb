require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users;")
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE spaces;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO users (email, password) VALUES ('test@test.com', 'password');")
  connection.exec("INSERT INTO spaces (space_name, description, price) VALUES ('123 Baker Street', 'Home of SH', '200');")
end