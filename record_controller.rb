require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/record')
require_relative('models/artist')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/records' do
  @records = Record.all()
  erb(:inventory)
end

get '/records/new' do
  erb(:new)
end

post '/records' do
  @record = Record.new( params )
  @record.save()
  erb( :create )
end

get '/records/:id/edit' do
  @record = Record.find_id( params[:id] )
  erb( :edit )
end

post '/records/:id/delete' do
  record = Record.find_id( params[:id] )
  record.delete()
  redirect to '/records'
end
