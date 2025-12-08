require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop-2.db"}

class Product <ActiveRecord::Base

end

get '/' do
	@products = Product.all
	
	erb :index
end

get '/about' do
	erb :about
end

get '/cart' do
  	
  	erb :cart
end

post '/cart' do
  
end