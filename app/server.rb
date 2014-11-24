require 'sinatra/base'
require 'data_mapper'
require './lib/user.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public/css") }

  get '/' do
    erb :homepage
  end

  get '/registration' do
    erb :registration
  end

  run! if app_file == $0
end
