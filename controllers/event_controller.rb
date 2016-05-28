require( 'pry-byebug' )
require_relative( '../models/event' )

# 7 restful routes: GET /events INDEX
get '/events' do
  @events = Event.all
  erb :'events/index'
end

# 7 restful routes: GET /events/new NEW
get '/events/new' do
  @events = Event.all
  @athletes = Athlete.all
  erb( :'events/new' )
end

# 7 restful routes: POST /events CREATE
post '/events' do
  @events = Event.new( params )
  @events.save(  )
  redirect to( '/events' )
end

# 7 restful routes: GET /events/:id SHOW
get '/events/:id' do
  @event = Event.find_by_id( params[ :id ] )
  erb( :'events/show' )
end

# 7 restful routes: GET /events/:id/edit EDIT
# FIXME: Figure out a way to maintain drop box options from original.  Currently it just resets everything back to the first value and it's confusing for the user.
get '/events/:id/edit' do
  @event = Event.find_by_id( params[ :id ] )
  @athletes = Athlete.all
  erb( :'events/edit' )
end

# FIXME: 7 restful routes: PUT /events/:id UPDATE
#Creates a new version of the event instead of updating the existing one.
put '/events/:id' do
  @event = Event.update( params )
  redirect to( "/events/#{params[:id]}" )
  binding.pry
end

# 7 restful routes: DELETE /events/:id/delete
delete '/events/:id' do
  Event.delete_by_id( params[:id] )
  redirect to( '/events' )
end
