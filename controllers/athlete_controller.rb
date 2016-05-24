require( 'pry-byebug' )
require_relative( '../models/athlete' )

# 7 restful routes: GET /athletes INDEX
get '/athletes' do
  @athletes = Athlete.all
  erb( :'athletes/index' )
end

# TODO: 7 restful routes: GET /athletes/new NEW
get '/athletes/new' do
  @nations = Nation.all
  erb( :'athletes/new' )
end

# TODO: 7 restful routes: POST /athletes CREATE

# TODO: 7 restful routes: GET /athletes/:id SHOW

# TODO: 7 restful routes: GET /athletes/:id/edit EDIT

# TODO: 7 restful routes: PUT /athletes/:id UPDATE

# TODO: 7 restful routes: DELETE /athletes/:id/delete
