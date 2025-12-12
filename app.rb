require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop-2.db"}

class Product <ActiveRecord::Base
end

class Order  <ActiveRecord::Base
end

get '/' do
	@products = Product.all
	
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
	@orders_input = params[:orders]  
  	
  	orders1 = parse_orders_input @orders_input
  	
  	if orders1.length == 0
  		return erb 'Your cart is empty'
  	end

  	@order = []
  	
  	orders1.each do |x|
  		@order << [Product.find(x[0].to_i), x[1]] 
  	end

	@name_products = ''
	@order.each do |x| 
		@name_products += "#{x[0].title}, #{x[1].to_s}; "
	end
  	
  	erb :cart
end

get '/admin' do
	

	@all_orders = Order.all
	
	erb :place_order
end

post '/place_order' do 

	@o = Order.new params[:order]
	@o.save

	erb :order_finish
end

def parse_orders_input orders_input
	s1 = orders_input.split(',')
	
	arr = []
	
	s1.each do |x|
		s2 = x.split('=')
		s3 = s2[0].split('_')
		
		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]

		arr.push arr2
	end
	return arr
end

