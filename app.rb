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
    @email = session[:email]
    redirect '/spaces'
  end

  get '/sign_in' do
    @email = session[:email]
    erb :sign_in
  end

  post '/sign_in' do
    @current_user = User.sign_in(email: params[:email], password: params[:password])
    if @current_user == "Unknown User"
      redirect '/sign_in'
    else
      redirect '/spaces'
    end
  end

  get '/spaces' do
    "Book a Space"
  end

  get '/spaces/new' do
    @space_name = session[:space_name]
    erb :new_space
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name], email: params[:email])
    @spaces = Space.all
    erb :spaces  
  end

  run! if app_file == $0
end
