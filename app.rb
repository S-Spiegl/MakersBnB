require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Hello"
  end

  get '/user/new' do
    erb :'users/new'
  end

  post '/user' do 
    redirect '/listings'
  end 


 

  run! if app_file == $0
end