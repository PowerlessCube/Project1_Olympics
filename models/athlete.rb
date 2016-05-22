require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './nation' )

class Athlete

  attr_accessor( :id, :name, :nation_id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @nation_id = options[ 'nation_id' ].to_i
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
      '#{@name}',
      #{@nation_id}
    )
    RETURNING *;"
    return Athlete.map_item( sql )
  end

  #READ: functions
  def self.all
    sql =
    "SELECT *
    FROM athletes;"
    return Athlete.map_items( sql )
  end

  def self.find_by_id( id )
    sql =
    "SELECT *
    FROM
      athletes
    WHERE
      id = #{id};"
    return Athlete.map_item( sql )
  end

  #UPDATE: functions
  def update
    sql =
    "UPDATE athletes
    SET
      name = '#{@name}',
      nation_id = #{@nation_id}
    WHERE
      id = #{@id}
    RETURNING *;"
    return Athlete.map_item( sql )
  end

  #DELETE: functions
  def self.delete_all
    sql =
    "DELETE FROM athletes;"
    SqlRunner.run( sql )
  end

  def self.delete_by_id( id )
    sql =
    "DELETE FROM athletes
    WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  #LOGIC functions:
  def populate_athletes
    # FIXME: : Create a function that populates the athletes array with the corresponding athletes by nation id.
    for nation in Nation.all
      if nation.id == nation_id
        @athletes << athlete
      end
    end
  end


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
