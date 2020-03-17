require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/record')
require_relative('models/artist')
also_reload('./models/*')

get '/' do
  erb(:"index")
end

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/artists")
end

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists' do
  @artist = Artist.new( params )
  @artist.save()
  erb( :"artists/create" )
end

get '/artists/:id/edit' do
  @record = Record.find( params[:id] )
  erb( :"artists/edit" )
end

post '/artists/:id/delete' do
  artist = Record.find_id( params[:id] )
  artists.delete()
  redirect to '/artists'
end
