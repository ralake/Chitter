require 'sinatra/base'
require 'data_mapper'
require './lib/user'
require './lib/peep'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/Chitter_#{env}")
DataMapper.finalize
DataMapper.auto_migrate!

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public/css") }
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
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
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = user.errors.full_messages
      erb :"users/new"
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    username, password = params[:username], params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:notice] = "The username or password is incorrect. Please try again."
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "See you soon!"
    redirect to('/')
  end

  get '/peeps' do
    erb :peeps
  end

  post '/homepage' do
    peep = Peep.create(:message => params[:message],
                       :author => current_user.name,
                       :username => current_user.username,
                       :created => "#{(Time.now).strftime('%d.%m.%Y - %H:%M')}",
                       :user_id => current_user.id)
    peep.save
    redirect to('/')
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  run! if app_file == $0
end
