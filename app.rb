require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Hello"
  end

  get '/spaces/add' do
    erb :'spaces/add'
  end

  post '/spaces/add' do
    Space.create(name_of_space: params[:name_of_space])
    redirect '/spaces'
  end

  get '/spaces' do
    erb :'spaces/index'
  end


  run! if app_file == $0
end