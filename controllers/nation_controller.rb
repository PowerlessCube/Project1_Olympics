require 'pry-byebug'
require_relative( '../models/nation' )

# 7 restful routes: GET /nations INDEX
get '/nations' do
  @nations = Nation.all
  erb :'nations/index'
end

# 7 restful routes: GET /nations/new NEW
get '/nations/new' do
  erb( :'nations/new' )
end

# 7 restful routes: POST /nations CREATE
post '/nations' do
 @nation = Nation.new( params )
 @nation.save()
 redirect to('/nations')
end

# 7 restful routes: GET /nations/:id SHOW
get '/nations/:id' do
  @nation = Nation.find_by_id( params[:id] )
  erb( :'nations/show' )
end

# 7 restful routes: GET /nations/:id/edit EDIT
get '/nations/:id/edit' do
  @nation = Nation.find_by_id( params[:id] )
  erb( :'nations/edit' )
end

# 7 restful routes: PUT /nations/:id UPDATE
put '/nations/:id' do
 @nation = Nation.update( params )
 redirect to( "/nations/#{params[:id]}" )
end

# 7 restful routes: DELETE /nations/:id/delete DELETE
delete '/nations/:id' do
  Nation.delete_by_id( params[:id] )
  redirect to('/nations')
end

nil
