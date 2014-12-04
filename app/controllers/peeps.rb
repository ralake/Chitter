class Chitter

  post '/homepage' do
    peep = Peep.create(:message => params[:message],
                       :author => current_user.name,
                       :username => current_user.username,
                       :created => "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}",
                       :user_id => current_user.id)
    peep.save
    redirect to('/')
  end

end