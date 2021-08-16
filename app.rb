require 'sinatra/base'
require 'sinatra/reloader'

class Airbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/spaces/new' do
    @space_name = session[:space_name]
    erb :new_space
  end

  get '/spaces' do
  end

  post '/spaces' do
    session[:space_name] = params[:space_name]
    erb :spaces
  end


  run! if app_file == $0
end
