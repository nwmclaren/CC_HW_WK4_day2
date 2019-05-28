require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')


# INDEX - SHOW ALL PIZZAS

get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end


# NEW - DISPLAY A FORM TO MAKE A NEW PIZZA ORDER

get '/pizza_orders/new' do
  erb(:new)
end

# SHOW - DISPLAY ONE PIAZZA

get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end


# CREATE - CREATE A DATABASE ENTRY FOR THE NEW PIZZA ORDER

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end


#EDIT - DISPLAY A FORM TO EDIT A PIZZA ORDER's DETAILS

# UPDATE - UPDATES A DATABASE ENTRY FOR THE EDITED PIZZA ORDER

# DELETE - DELETES A PIZZA ORDER FROM THE DATABASE
