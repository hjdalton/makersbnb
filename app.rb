require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user'
require_relative './lib/space.rb'
require_relative './lib/booking.rb'
require_relative './lib/request.rb'

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
    Space.create(space_name: params[:space_name], description: params[:description],
      price: params[:price], current_user: session[:current_user], start_date: params[:start_date], end_date: params[:end_date])
    @spaces = Space.all
    redirect '/spaces'
  end

  post '/requests' do
    @made = Request.made(current_user: session[:current_user])
    @received = Request.received(current_user: session[:current_user])
    erb :requests
  end

  get '/spaces/listing/:id' do
    @spaces = Space.all
    erb :space_listing
  end

  post '/spaces/filter' do
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @spaces = Space.filter(start_date: @start_date, end_date: @end_date)
    erb :spaces
  end

  get '/spaces/requested/:id' do
    @received
    erb :confirm_requests
  end

  post '/accept' do
    redirect '/requests'
  end

  post '/reject' do
    Booking.reject(id: session[:booking_id])
    redirect '/requests'
  end

  get '/requests' do
    @made = Request.made(current_user: session[:current_user])
    @received = Request.received(current_user:  session[:current_user])
 
    p @received.id #retrieve value from @id key within the array
    session[:booking_id] = @booking_id
    p session[:booking_id]
    erb :requests
  end

  run! if app_file == $0
end
