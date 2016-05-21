require( 'pg' )
require_relative( '../db/sql_runner' )

class Athlete

  attr_accessor( :id, :name, :nation_id )

  def initialize( options )
    @id = options[ :id ].to_i
    @name = options[ :name ]
    @nation_id = options[ :nation_id ].to_i
  end

  # TODO: Create Athlete class CRUD functions

  #CREATE: function
  def save
    sql =
    "INSERT INTO athletes(
      name,
      nation_id
    )
    VALUES(
      #{@name},
      #{@nation_id}
    )
    RETURNING *;"
    return Athlete.map_item( sql )
  end

  #READ: functions

  #UPDATE: functions

  #DELETE: functions

  #Helper functions
  def self.map_items( sql )
    athletes = SqlRunner.run( sql )
    result = athletes.map{ | athlete | Athlete.new( athlete ) }
    return result
  end

  def self.map_item( sql )
    result = Athlete.map_items( sql )
    return result.first
  end

end
