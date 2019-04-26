# frozen_string_literal: true

require 'sinatra'
require 'sequel'
require 'socket'

DB = Sequel.connect(ENV.fetch('DB'))

get '/' do
  erb :index
end

post '/' do
  DB[:entries].insert(text: params[:text])
  redirect '/'
end

def entries
  DB[:entries].order(Sequel.desc(:created_at)).limit(10).all
end

def hostname
  Socket.gethostname
end
