require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space'
require_relative './lib/user'

class MakersBnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    "Hello"
  end

  get '/user/new' do
    erb :'users/new'
  end

  post '/user' do
    result = User.create(username: params[:username])
    session[:id] = result.id
    session[:username] = result.username
    redirect '/user'
  end

  get '/user' do
    @username = session[:username]
    erb :user
  end

  get '/spaces/add' do
    erb :'spaces/add'
  end

  post '/spaces/add' do
    Space.create(name_of_space: params[:name_of_space], user_id: session[:id])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces/request/:id' do
    session[:space_id] = params[:id]
    @spaces = Space.all
    erb :'spaces/index'
  end


  run! if app_file == $0
end
