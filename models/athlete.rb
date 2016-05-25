require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './nation' )
require 'pry-byebug'

class Athlete

  attr_accessor( :id, :name, :nation_id, :gold_medals )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @nation_id = options[ 'nation_id' ].to_i
  end

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
    );"
    return Athlete.map_item( sql )
  end

  #READ: functions

  def gold_medals
    sql =
    "SELECT *
     FROM events
     WHERE gold_athlete_id = #{@id}"
    return Event.map_items( sql )
  end

  def silver_medals
    sql =
    "SELECT *
     FROM events
     WHERE silver_athlete_id = #{@id}"
    return Event.map_items( sql )
  end

  def bronze_medals
    sql =
    "SELECT *
     FROM events
     WHERE bronze_athlete_id = #{@id}"
    return Event.map_items( sql )
  end

  def nation
    sql =
    "SELECT *
    FROM nations n
    WHERE n.id = #{@nation_id};"
    return Nation.map_item( sql )
  end

  def event
    sql =
    "SELECT e.*
    FROM events e
    INNER JOIN event_registers er
    ON er.event_id = e.id
    WHERE er.athlete_id = #{@id};"
    return Event.map_items( sql )
  end

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
  def self.update( options )
    SqlRunner.run(
    "UPDATE athletes
    SET
      name = '#{options['name']}',
      nation_id = #{options['nation_id']}
    WHERE
      id = #{options['id']};"
    )
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
