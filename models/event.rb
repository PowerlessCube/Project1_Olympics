require( 'pg' )
require( 'pry-byebug' )
require_relative( '../db/sql_runner' )

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

  def athletes
    sql =
    "SELECT
      a.*
    FROM
      athletes a
    INNER JOIN
      event_registers er
    ON
      er.athlete_id = a.id
    INNER JOIN
      events e
    ON
      er.event_id = e.id
    WHERE
      #{@id} = er.event_id;"
    return Athlete.map_items( sql )
  end

  def gold_medal_athlete
    sql =
    "SELECT
      a.*
    FROM
      athletes a
    WHERE
      #{@gold_athlete_id} = a.id;"
    return Athlete.map_item( sql )
  end

  def silver_medal_athlete
    sql =
    "SELECT
      a.*
    FROM
      athletes a
    WHERE
      #{@silver_athlete_id} = id;"
    return Athlete.map_item( sql )
  end

  def bronze_medal_athlete
    sql =
    "SELECT
      a.*
    FROM
      athletes a
    WHERE
      #{@bronze_athlete_id} = a.id;"
    return Athlete.map_item( sql )
  end

  #UPDATE: functions
  def update( options )
    SqlRunner.run(
    "UPDATE events
    SET
      name = '#{options['name']}',
      gold_athlete_id = #{options['gold_athlete_id']},
      silver_athlete_id = #{options['silver_athlete_id']},
      bronze_athlete_id = #{options['bronze_athlete_id']}
    WHERE
      id = #{options['id']};"
    )
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

  # TODO: logic to ensure that an athlete can not win more than one medal per event.

  # TODO: logic that involves selecting medal winners from the pool of athletes that have registered for the event.

  # TODO: Logic that lists all athletes participating in a given event.

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
