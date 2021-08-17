require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'
require_relative './lib/spaces.rb'

class Airbnb < Sinatra::Base
  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/signup' do
    User.create(email: params[:email], password: params[:password1])
    redirect '/spaces'
  end

  get '/spaces' do
    "Book a Space"
  end
  
  
  get '/spaces/new' do
    @space_name = session[:space_name]
    erb :new_space
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name])
    @spaces = Space.all
    erb :spaces   #display the spaces listed by that user
  end

  get '/sign_in' do
    erb :sign_in
  end
  
  run! if app_file == $0
end
