require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative './lib/user'
require_relative './lib/peep'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public") }
  enable :sessions
  enable :partial_underscores
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  run! if app_file == $0

end

require_relative "./controllers/user_management"
require_relative "./controllers/peeps"
