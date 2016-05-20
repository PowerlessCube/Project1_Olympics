require( 'pg' )
require( 'pry-byebug' )

class Athlete

  attr_accessor( :id, :name, :nation_id )

  def initialize( options )
    @id = options[ :id ].to_i
    @name = options[ :name ]
    @nation_id = options[ :nation_id ].to_i
  end

end
