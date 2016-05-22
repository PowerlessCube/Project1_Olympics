require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './athlete' )


class Nation

  attr_accessor( :id, :name, :acronym, :flag, :athletes )

  def initialize ( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @acronym = options[ 'acronym' ].upcase
    @flag = options[ 'flag' ]
  end

# TODO: Create Nation class CRUD functions

  #CREATE: function
  def save
    sql =
      "INSERT INTO nations(
        name,
        acronym,
        flag
      )
      VALUES(
        '#{@name}',
        '#{@acronym}',
        '#{@flag}'
      )
      RETURNING *;"
    return Nation.map_item( sql )
  end

  #UPDATE: functions
  def update
    sql =
      "UPDATE nations
      SET
        name = '#{@name}',
        acronym = '#{@acronym}',
        flag = '#{@flag}'
      WHERE
        id = '#{@id}'
      RETURNING *;"
    return Nation.map_item( sql )
  end

  #READ: functions.
  def self.all
    sql =
    "SELECT *
    FROM nations;"
    Nation.map_items( sql )
  end

  def self.find_by_id( id )
    sql =
    "SELECT *
    FROM
      nations
    WHERE
      id = #{id};"
    return Nation.map_item( sql )
  end

  #DELETE functions
  def self.delete_all
    sql=
    "DELETE FROM nations;"
    SqlRunner.run( sql )
  end

  def self.delete_by_id( id )
    sql=
    "DELETE FROM nations
    WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  #LOGIC functions:
  def athlete_count?
    return Athlete.nation?( @id ).count
  end


  # TODO: How many medals

  #HELPER functions:
  def self.map_items( sql )
    nations = SqlRunner.run( sql )
    result = nations.map{ | nation | Nation.new( nation ) }
    return result
  end

  def self.map_item( sql )
    result = Nation.map_items( sql )
    return result.first
  end

end
