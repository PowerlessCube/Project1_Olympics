require( 'pry-byebug' )
require_relative( '../models/athlete' )

# 7 restful routes: GET /athletes INDEX
get '/athletes' do
  @athletes = Athlete.all
  erb( :'athletes/index' )
end

# 7 restful routes: GET /athletes/new NEW
get '/athletes/new' do
  @nations = Nation.all
  erb( :'athletes/new' )
end

# 7 restful routes: POST /athletes CREATE
post '/athletes' do
  @athlete = Athlete.new( params )
  @athlete.save()
  redirect to( '/nations/:id' )
end

# TODO: 7 restful routes: GET /athletes/:id SHOW
get '/athletes/:id' do
  @athlete = Athlete.find_by_id( params[:id] )
  erb( :'athletes/show' )
end

# TODO: 7 restful routes: GET /athletes/:id/edit EDIT

# TODO: 7 restful routes: PUT /athletes/:id UPDATE

# TODO: 7 restful routes: DELETE /athletes/:id/delete
