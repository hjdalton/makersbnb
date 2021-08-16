require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'

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
  

  run! if app_file == $0
end