# 7 restful routes: GET /events INDEX
get '/events' do
  @events = Event.all
  erb :'events/index'
end

# TODO: 7 restful routes: GET /events/new NEW
get '/events/new' do
  @events = Event.all
  @athletes = Athlete.all
  erb( :'events/new' )
end

# TODO: 7 restful routes: POST /events CREATE

# TODO: 7 restful routes: GET /events/:id SHOW

# TODO: 7 restful routes: GET /events/:id/edit EDIT

# TODO: 7 restful routes: PUT /events/:id UPDATE

# TODO: 7 restful routes: DELETE /events/:id/delete
