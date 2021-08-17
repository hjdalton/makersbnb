require 'pg'
require '/Users/heatherdalton/makers_projects/makersbnb/lib/user.rb'

class Space
  def self.create(space_name:, email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  connection.exec("INSERT INTO spaces (space_name, user_id) VALUES ('#{space_name}', (SELECT id FROM users WHERE email = '#{email}'))")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  result = connection.exec('SELECT * FROM spaces')
  result.map { |spaces| spaces['space_name'] }
  end
end

