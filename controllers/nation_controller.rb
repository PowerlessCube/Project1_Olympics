require 'pry-byebug'
require_relative( '../models/nation.rb' )

#7 restful routes
# TODO: 7 restful routes: GET /nations INDEX

get '/nations' do
  @nations = Nation.all
  erb :'nations/index'
end

# TODO: 7 restful routes: GET /nations INDEX

# TODO: 7 restful routes: GET /nations/new NEW

# TODO: 7 restful routes: POST /nations CREATE

# TODO: 7 restful routes: GET /nations/:id SHOW

# TODO: 7 restful routes: GET /nations/:id/edit EDIT

# TODO: 7 restful routes: PUT /nations/:id UPDATE

# TODO: 7 restful routes: DELETE /nations/:id/delete DESTROY

nil
