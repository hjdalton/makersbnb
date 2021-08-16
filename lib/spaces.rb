require 'pg'

class Space
  def self.create(space_name: )
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  connection.exec("INSERT INTO spaces (space_name) VALUES ('#{space_name}')")

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  result = connection.exec('SELECT * FROM spaces')
  result.map { |spaces| spaces['space_name'] }
end
end

end
