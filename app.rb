require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/animals_controller')
require_relative('controllers/customers_controller')
also_reload("./models/*")

get '/' do
  erb( :index )
end
