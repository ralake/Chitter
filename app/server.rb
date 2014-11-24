require 'sinatra/base'
require 'data_mapper'
require './lib/user'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/Chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public/css") }
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :homepage
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/' do
    user = User.create(:name => params[:name],
                        :username => params[:username],
                        :email => params[:email],
                        :password => params[:password])
    user.save
    session[:user_id] = user.id
    erb :homepage
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  run! if app_file == $0
end
