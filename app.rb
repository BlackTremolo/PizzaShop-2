require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

get '/' do
	erb :index
end

get '/about' do
	erb :about
end