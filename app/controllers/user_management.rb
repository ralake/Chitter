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

end