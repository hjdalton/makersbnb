require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, spaces;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO users (email, password) VALUES ('test@test.com', 'password');")
end

def add_space_to_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO spaces (space_name, user_id) VALUES ('test_space', (SELECT id FROM users WHERE email = 'test@test.com'));")
end