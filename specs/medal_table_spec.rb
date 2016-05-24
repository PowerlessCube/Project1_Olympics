require( 'minitest/autorun' )
require( 'minitest/rg' )
require( 'pry-byebug' )
require_relative( '../models/medal_table' )
require_relative( '../models/nation' )


class TestMedalTable < Minitest::Test

  def setup
    @nations = Nation.all
  end

  def test_nations_name
    assert_equal( 'Great Britain', @nations[0].name )
  end

  def test_nations_acronym
    assert_equal( 'NOR' , @nations[1].acronym )
  end

  def test_total_gold_points
    assert_equal( 10, total_gold_points( @nations[0] ) )
  end

end
