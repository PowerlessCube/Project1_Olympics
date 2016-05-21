require( 'minitest/autorun' )
require( 'minitest/rg' )
require( 'pry-byebug' )
require_relative( '../models/event_register' )

class TestEventRegister < MiniTest::Test

  def setup
    @event1 = EventRegister.new( { id: 1, athlete_id: 2, event_id: 3} )
  end

  #instance variable tests
  def test_event_register_id
    assert_equal( 1, @event1.id )
  end

  def test_event_register_athlete_id
    assert_equal( 2, @event1.athlete_id )
  end

  def test_event_register_event_id
    assert_equal( 3, @event1.event_id )
  end

end
