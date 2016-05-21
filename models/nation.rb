require( 'pg' )
require( 'pry-byebug' )
require_relative( '../db/sql_runner' )

class Nation

  attr_accessor( :id, :name, :acronym, :flag, :athletes )

  def initialize ( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @acronym = options[ 'acronym' ].upcase
    @flag = options[ 'flag' ]
    @athletes = options[ 'athletes' ]
  end
  #do I need an athletes array? I think no, it's enough to be instanciated as an empty array.

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

  #helper functions
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
