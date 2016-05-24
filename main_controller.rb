require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./controllers/nation_controller')


get( '/home' ) do
  return "Hello World!"
end

nil
