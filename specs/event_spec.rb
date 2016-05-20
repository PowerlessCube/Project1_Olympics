require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/event' )

class TestEvent < Minitest::Test

  def setup
    @event = Event.new( { id: 1, name: '100 mtr Sprint', gold_athlete_id: 1, silver_athlete_id: 2, bronze_athlete_id: 3 } )
  end

  def test_event_id
    assert_equal( 1, @event.id )
  end

end
