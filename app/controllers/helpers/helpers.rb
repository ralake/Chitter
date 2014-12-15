def sign_up_checks(user)
  if user.save
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:errors] = user.errors.full_messages
    erb :"users/new"
  end
end

def sign_in_checks(user)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:notice] = "The username or password is incorrect. Please try again."
    erb :"sessions/new"
  end
end