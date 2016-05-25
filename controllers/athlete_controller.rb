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

# 7 restful routes: GET /athletes/:id SHOW
get '/athletes/:id' do
  @athlete = Athlete.find_by_id( params[:id] )
  erb( :'athletes/show' )
end

# 7 restful routes: GET /athletes/:id/edit EDIT
get '/athletes/:id/edit' do
  @athlete = Athlete.find_by_id( params[:id] )
  @nations = Nation.all
  erb( :'athletes/edit' )
end

# FIXME: 7 restful routes: PUT /athletes/:id UPDATE
#not redirecting correctly and is going to a 'sinatra doesn't know this ditty' page.
put '/athletes/:id' do
  @athlete = Athlete.update( params )
  redirect to( "/athletes/#{params[:id]}" )
end

# FIXME: 7 restful routes: DELETE /athletes/:id/delete
delete '/athletes/:id' do
  Athlete.delete_by_id( params[:id] )
  redirect to( '/athletes' )
end
