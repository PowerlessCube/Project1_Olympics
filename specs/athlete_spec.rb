require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/athlete' )

class TestAthlete < MiniTest::Test

  def setup
     @athlete1 = Athlete.new( { id: 1, name: 'Alistair Mackay', nation_id: 1 } )
  end

  #instance variable tests
  def test_athlete_id
    assert_equal( 1, @athlete1.id )
  end

  def test_athlete_name
    assert_equal( 'Alistair Mackay', @athlete1.name )
  end

  def test_athlete_nation_id
    assert_equal( 1, @athlete1.nation_id )
  end

end
