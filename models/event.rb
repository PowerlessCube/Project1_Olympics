require( 'pg' )
require( 'pry-byebug' )

class Event

  attr_accessor( :id, :name, :gold_athlete_id, :silver_athlete_id, :bronze_athlete_id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @gold_athlete_id = options[ 'gold_athlete_id' ].to_i
    @silver_athlete_id = options[ 'silver_athlete_id' ].to_i
    @bronze_athlete_id = options[ 'bronze_athlete_id' ].to_i
  end

  def save
    sql =
    "INSERT INTO events(
      name,
      gold_athlete_id,
      silver_athlete_id,
      bronze_athlete_id
    )
    VALUES(
      '#{@name}',
      #{@gold_athlete_id},
      #{@silver_athlete_id},
      #{@bronze_athlete_id}
    )
    RETURNING *;"
    return Event.map_item( sql )
  end

  #READ: functions
  def self.all
    sql =
    "SELECT *
    FROM events;"
    return Event.map_items( sql )
  end

  def self.find_by_id( id )
    sql =
    "SELECT *
    FROM
      events
    WHERE
      id = #{id};"
    return Event.map_item( sql )
  end

  #UPDATE: functions
  def update
    sql =
    "UPDATE events
    SET
      name = '#{@name}',
      gold_athlete_id = #{@gold_athlete_id},
      silver_athlete_id = #{@silver_athlete_id},
      bronze_athlete_id = #{@bronze_athlete_id}
    WHERE
      id = #{@id}
    RETURNING *;"
    return Event.map_item( sql )
  end

  #DELETE: functions
  def self.delete_all
    sql =
    "DELETE FROM events;"
    SqlRunner.run( sql )
  end

  def self.delete_by_id( id )
    sql =
    "DELETE FROM events
    WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  #LOGIC functions:


  #Helper functions
  def self.map_items( sql )
    events = SqlRunner.run( sql )
    result = events.map{ | event | Event.new( event ) }
    return result
  end

  def self.map_item( sql )
    result = Event.map_items( sql )
    return result.first
  end

end
