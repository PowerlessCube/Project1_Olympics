require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/event' )

class TestEvent < Minitest::Test

  def setup
    @event = Event.new( { id: 1, name: '100 mtr Sprint', gold_athlete_id: 1, silver_athlete_id: 2, bronze_athlete_id: 3 } )
  end

#instance variable tests
  def test_event_id
    assert_equal( 1, @event.id )
  end

  def test_event_name
    assert_equal( '100 mtr Sprint', @event.name )
  end

  def test_gold_athlete_id
    assert_equal( 1, @event.gold_athlete_id )
  end

  def test_silver_athlete_id
    assert_equal( 2, @event.silver_athlete_id )
  end

  def test_bronze_athlete_id
    assert_equal( 3, @event.bronze_athlete_id )
  end

end
