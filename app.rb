require 'sinatra/base'
require 'sinatra/reloader'

class Airbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/spaces' do
    "Book a Space"
  end
  

  run! if app_file == $0
end