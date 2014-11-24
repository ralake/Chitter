require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relatve 'data_mapper_setup'

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public/css") }
  use Rack::Flash
  use Rack::MethodOverride

  run! if app_file == $0
end
