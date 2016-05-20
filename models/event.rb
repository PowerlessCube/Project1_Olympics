require( 'pg' )
require( 'pry-byebug' )

class Event

  attr_accessor( :id, :name, :gold_athlete_id, :silver_athlete_id, :bronze_athlete_id )

  def initialize( options )
    @id = options[ :id ].to_i
    @name = options[ :name ]
    @gold_athlete_id = options[ :gold_athlete_id ].to_i
    @silver_athlete_id = options[ :silver_athlete_id ].to_i
    @bronze_athlete_id = options[ :bronze_athlete_id ].to_i
  end

end
