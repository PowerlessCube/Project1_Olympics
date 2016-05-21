require( 'minitest/autorun' )
require( 'minitest/rg' )
require( 'pry-byebug' )
require_relative( '../models/nation' )
require_relative( '../models/athlete' )

class TestNation < Minitest::Test

  def setup
    @athlete1 = Athlete.new( { id: 1, name: 'Alistair Mackay', nation_id: 1 } )
    @nation1 = Nation.new( { id: 1, name: 'America', acronym: 'usa', flag: 'URL of a flag', athletes: [ @athlete1 ] } )
  end

#instance variable tests
  def test_nation_id
    assert_equal( 1, @nation1.id )
  end

  def test_nation_name
    assert_equal( 'America', @nation1.name )
  end

  def test_nation_acronym
    assert_equal( 'USA', @nation1.acronym )
  end

  def test_nation_flag
    # TODO: figure out how to incorperate flag images to a database.
    assert_equal( 'URL of a flag', @nation1.flag )
  end

  def test_nation_athletes
    assert_equal( [ @athlete1 ], @nation1.athletes )
  end

end
