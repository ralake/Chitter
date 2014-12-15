require_relative './helpers/helpers'

class Chitter

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
    sign_up_checks(user)
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    username, password = params[:username], params[:password]
    user = User.authenticate(username, password)
    sign_in_checks(user)
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "See you soon!"
    redirect to('/')
  end



end