require( 'pry-byebug' )

require_relative( '../models/medal_table' )
require_relative( '../models/nation' )
require_relative( '../models/event' )
require_relative( '../models/athlete' )
require_relative( '../models/event_register' )

class MedalTable

  def initialize( )
    @nations = Nation.all
  end

end
