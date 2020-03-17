require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/record')
require_relative('../models/artist')
also_reload('./models/*')

get '/' do
  erb(:"index")
end

get '/records' do
  @records = Record.all()
  erb(:"records/inventory")
end

get '/records/new' do
  @artists = Artist.all
  erb(:"records/new")
end

post '/records' do
  @record = Record.new( params )
  @record.save()
  erb( :"records/create" )
end

get '/records/:id/edit' do
  @record = Record.find_id( params[:id] )
  erb( :"records/edit" )
end

post '/records/:id/delete' do
  record = Record.find( params[:id] )
# binding.pry
  record.delete()

  redirect to '/records'
end

get '/stock' do
  @records = Record.all
  erb(:"record/stock")
end
