require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/medal_table' )
require_relative( '../models/nation' )
require_relative( '../models/event' )
require_relative( '../models/athlete' )
require_relative( '../models/event_register' )

class TestMedalTable < Minitest::Test

  def setup
    EventRegister.delete_all
    Event.delete_all
    Athlete.delete_all
    Nation.delete_all

    @n1 = Nation.new( { 'name' => 'Great Britain', 'acronym' => 'gbr', 'flag' => 'URL of GBR flag' } ).save()
    @n2 = Nation.new( { 'name' => 'Norway', 'acronym' => 'nor', 'flag' => 'URL of NOW flag' } ).save()

    @a1 = Athlete.new( { 'name' => 'Bobby Runfast', 'nation_id' => @n1.id } ).save()
    @a2 = Athlete.new( { 'name' => 'Johny Jumphigh', 'nation_id' => @n1.id } ).save()
    @a3 = Athlete.new( { 'name' => 'Jorgen Throwfar', 'nation_id' => @n2.id } ).save()
    @a4 = Athlete.new( { 'name' => 'Bjron Swimfast', 'nation_id' => @n2.id } ).save()
    @a5 = Athlete.new( { 'name' => 'Borghilt Fallsbehind', 'nation_id' => @n2.id } ).save()
    @a6 = Athlete.new( { 'name' => 'Gary Cantbearsed', 'nation_id' => @n1.id } ).save()

    @e1 = Event.new( { 'name' => '100meters', 'gold_athlete_id' => @a1.id, 'silver_athlete_id' => @a2.id, 'bronze_athlete_id' => @a3.id } ).save()
    @e2 = Event.new( { 'name' => 'Swimming', 'gold_athlete_id' => @a2.id, 'silver_athlete_id' => @a3.id, 'bronze_athlete_id' => @a4.id } ).save()
    @e3 = Event.new( { 'name' => 'Marathon', 'gold_athlete_id' => @a3.id, 'silver_athlete_id' => @a4.id, 'bronze_athlete_id' => @a1.id } ).save()

    @er1 = EventRegister.new( { 'athlete_id' => @a1.id, 'event_id' => @e1.id } ).save()
    @er2 = EventRegister.new( { 'athlete_id' => @a2.id, 'event_id' => @e1.id } ).save()
    @er3 = EventRegister.new( { 'athlete_id' => @a3.id, 'event_id' => @e1.id } ).save()
    @er4 = EventRegister.new( { 'athlete_id' => @a4.id, 'event_id' => @e1.id } ).save()
    @er5 = EventRegister.new( { 'athlete_id' => @a5.id, 'event_id' => @e1.id } ).save()
    @er6 = EventRegister.new( { 'athlete_id' => @a6.id, 'event_id' => @e1.id } ).save()

    @er7 = EventRegister.new( { 'athlete_id' => @a1.id, 'event_id' => @e2.id } ).save()
    @er8 = EventRegister.new( { 'athlete_id' => @a2.id, 'event_id' => @e2.id } ).save()
    @er9 = EventRegister.new( { 'athlete_id' => @a3.id, 'event_id' => @e2.id } ).save()
    @er10 = EventRegister.new( { 'athlete_id' => @a4.id, 'event_id' => @e2.id } ).save()
    @er11 = EventRegister.new( { 'athlete_id' => @a5.id, 'event_id' => @e2.id } ).save()
    @er12 = EventRegister.new( { 'athlete_id' => @a6.id, 'event_id' => @e2.id } ).save()

    @er13 = EventRegister.new( { 'athlete_id' => @a1.id, 'event_id' => @e3.id } ).save()
    @er14 = EventRegister.new( { 'athlete_id' => @a2.id, 'event_id' => @e3.id } ).save()
    @er15 = EventRegister.new( { 'athlete_id' => @a3.id, 'event_id' => @e3.id } ).save()
    @er16 = EventRegister.new( { 'athlete_id' => @a4.id, 'event_id' => @e3.id } ).save()
    @er17 = EventRegister.new( { 'athlete_id' => @a5.id, 'event_id' => @e3.id } ).save()
    @er18 = EventRegister.new( { 'athlete_id' => @a6.id, 'event_id' => @e3.id } ).save()

  end

  def test_gold_medal_count
    assert_equal( 2, @n1.gold_medals )
  end

end
