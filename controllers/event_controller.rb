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

# TODO: 7 restful routes: GET /events/:id SHOW
get '/events/:id' do
  @event = Event.find_by_id( params[ :id ] )
  erb( :'events/show' )
end

# TODO: 7 restful routes: GET /events/:id/edit EDIT

# TODO: 7 restful routes: PUT /events/:id UPDATE

# TODO: 7 restful routes: DELETE /events/:id/delete
