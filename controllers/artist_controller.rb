require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/record')
require_relative('../models/artist')
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
  @artist = Artist.find( params[:id] )
  erb( :"artists/edit" )
end

post '/artists/:id' do # update
  Artist.new( params ).update
  redirect to '/artists'
end

post '/artists/:id/delete' do
  artist = Artist.find( params[:id] )
  artist.delete()
  redirect to '/artists'
end
