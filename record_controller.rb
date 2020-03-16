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

get '/records/new' do # new
  erb(:new)
end

post '/records' do # create
  @record = Record.new( params )
  @record.save()
  erb( :create )
end

get '/records/:id/edit' do # edit
  @record = Record.find_id( params[:id] )
  erb( :edit )
end
