require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'
require_relative './lib/space.rb'

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
    erb :sign_in
  end

  post '/sign_in' do
    @current_user = User.sign_in(email: params[:email], password: params[:password])
    if @current_user == "Unknown User"
      redirect '/sign_in'
    else
      session[:current_user] = @current_user
      redirect '/spaces'
    end
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    @space_name = session[:space_name]
    @description = session[:description]
    @price = session[:price]
    erb :new_space
  end

  post '/spaces' do
    Space.create(space_name: params[:space_name], email: session[:current_user],description: params[:description], price: params[:price])
    @spaces = Space.all
    redirect '/spaces'
  end

  run! if app_file == $0
end
