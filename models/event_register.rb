require( 'pg' )
require( 'pry-byebug' )

class EventRegister

  attr_accessor( :id, :athlete_id, :event_id )

  def initialize( options )
    @id = options[ :id ].to_i
    @athlete_id = options[ :athlete_id ].to_i
    @event_id = options[ :event_id ].to_i
  end

  def save
    sql =
    "INSERT INTO event_registers(
      athlete_id,
      event_id
    )
    VALUES(
      #{@athlete_id},
      #{@event_id}
    )
    RETURNING *;"
    return EvetRegister.map_item( sql )
  end

  #READ: functions
  def self.all
    sql =
    "SELECT *
    FROM event_registers;"
    return EvetRegister.map_items( sql )
  end

  def self.find_by_id( id )
    sql =
    "SELECT *
    FROM
      event_registers
    WHERE
      id = #{id};"
    return EvetRegister.map_item( sql )
  end

  #UPDATE: functions
  def update
    sql =
    "UPDATE event_registers
    SET
      athlete_id = #{@athlete_id},
      event_id = #{@event_id}
    WHERE
      id = #{@id}
    RETURNING *;"
    return EvetRegister.map_item( sql )
  end

  #DELETE: functions
  def self.delete_all
    sql =
    "DELETE FROM event_registers;"
    SqlRunner.run( sql )
  end

  def self.delete_by_id( id )
    sql =
    "DELETE FROM event_registers
    WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  #LOGIC functions:


  #Helper functions
  def self.map_items( sql )
    event_registers = SqlRunner.run( sql )
    result = event_registers.map{ | event | EvetRegister.new( event ) }
    return result
  end

  def self.map_item( sql )
    result = EvetRegister.map_items( sql )
    return result.first
  end

end
