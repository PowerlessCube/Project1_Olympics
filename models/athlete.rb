require( 'pg' )
require( 'pry-byebug' )

class Athlete

  attr_accessor( :id, :name, :nation_id )

  def initialize( options )
    @id = options[ :id ].to_i
    @name = options[ :name ]
    @nation_id = options[ :nation_id ].to_i
  end

  # TODO: Create Athlete class CRUD functions 

  # TODO: create Athlete class helper functions for mapping items and map item.

end
