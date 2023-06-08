require 'sinatra/base'
require 'sinatra/reloader'
require 'active_record'
require_relative 'lib/database_connection'

DatabaseConnection.establish_database_connection

DatabaseConnection.establish_database_connection

class Application < Sinatra::Base
  UPLOADS_DIRECTORY = File.join(__dir__, 'img')
  enable :sessions

  configure do
    set :public_folder, UPLOADS_DIRECTORY
  end

  configure :development do
    register Sinatra::Reloader
  end

  set :public_folder, File.join(__dir__, 'public')
  