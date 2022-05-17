require 'sinatra/base'
require 'sinatra/reloader'

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
    session[:username] = params[:username]
    redirect '/user'
  end 

  get '/user' do
    @username = session[:username]
    erb :user
  end

  run! if app_file == $0
end
