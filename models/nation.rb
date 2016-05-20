require( 'pg' )
require( 'pry-byebug' )

class Nation

  attr_accessor( :id, :name, :acronym, :flag, :athletes )

  def initialize ( options )
    @id = options[ :id ].to_i
    @name = options[ :name ]
    @acronym = options[ :acronym ].upcase
    @flag = options[ :flag ]
    @athletes = options[ :athletes ]
  end

end
