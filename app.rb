require 'sinatra/base'
require 'sinatra/reloader'
require '/Users/Student/Documents/makersbnb/lib/spaces.rb'

class Airbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/spaces/new' do
    @space_name = session[:space_name]
    erb :new_space
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name])
    @spaces = Space.all
    erb :spaces
  end


  run! if app_file == $0
end
