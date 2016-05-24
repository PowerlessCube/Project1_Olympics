require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./controllers/nation_controller')
require_relative('./controllers/medal_table_controller')
require_relative('./controllers/event_controller')
require_relative('./controllers/athlete_controller')


get( '/home' ) do
  return "Hello World!"
end

nil
