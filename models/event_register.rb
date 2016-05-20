require( 'pg' )
require( 'pry-byebug' )

class EventRegister

  attr_accessor( :id, :athlete_id, :event_id )

  def initialize( options )
    @id = options[ :id ].to_i
    @athlete_id = options[ :athlete_id ].to_i
    @event_id = options[ :event_id ].to_i
  end

end
