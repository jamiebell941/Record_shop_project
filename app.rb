require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/artist_controller')
require_relative('controllers/record_controller')

get '/' do
  erb( :index )
end
