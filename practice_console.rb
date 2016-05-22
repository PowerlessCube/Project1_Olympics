#Ruby play ground to check that SQL commands are working as intended.

require_relative( './models/nation' )
require_relative( './models/athlete' )
require_relative( './models/event' )
require_relative( './models/event_register' )

require( 'pry-byebug' )

EventRegister.delete_all
Event.delete_all
Athlete.delete_all
Nation.delete_all

nation1 = Nation.new( { 'name' => 'Great Britain', 'acronym' => 'gbr', 'flag' => 'URL of GBR flag' } )
nation2 = Nation.new( { 'name' => 'Norway', 'acronym' => 'nor', 'flag' => 'URL of NOW flag' } )

n1 = nation1.save()
n2 = nation2.save()

athlete1 = Athlete.new( { 'name' => 'Bobby Runfast', 'nation_id' => n1.id } )
athlete2 = Athlete.new( { 'name' => 'Johny Jumphigh', 'nation_id' => n1.id } )
athlete3 = Athlete.new( { 'name' => 'Jorgen Throwfar', 'nation_id' => n2.id } )
athlete4 = Athlete.new( { 'name' => 'Bjron Swimfast', 'nation_id' => n2.id } )
athlete5 = Athlete.new( { 'name' => 'Borghilt Fallsbehind', 'nation_id' => n2.id } )
athlete6 = Athlete.new( { 'name' => 'Gary Cantbearsed', 'nation_id' => n1.id } )

a1 = athlete1.save() #Bobby Runfast, GB
a2 = athlete2.save() #Johny Jumphigh, GB
a3 = athlete3.save() #Jorgen Throwfar, NOR
a4 = athlete4.save() #Bjorn Swimfast, NOR
a5 = athlete5.save() #Borghilt Fallsbehind, NOR
a6 = athlete6.save() #Gary Cantbearsed, GB

event1 = Event.new( { 'name' => '100meters', 'gold_athlete_id' => a1.id, 'silver_athlete_id' => a2.id, 'bronze_athlete_id' => a3.id } )
event2 = Event.new( { 'name' => 'Swimming', 'gold_athlete_id' => a2.id, 'silver_athlete_id' => a3.id, 'bronze_athlete_id' => a4.id } )
event3 = Event.new( { 'name' => 'Marathon', 'gold_athlete_id' => a3.id, 'silver_athlete_id' => a4.id, 'bronze_athlete_id' => a1.id } )

e1 = event1.save()
e2 = event2.save()
e3 = event3.save()

event_register1 = EventRegister.new( { 'athlete_id' => a1.id, 'event_id' => e1.id } )
event_register2 = EventRegister.new( { 'athlete_id' => a2.id, 'event_id' => e1.id } )
event_register3 = EventRegister.new( { 'athlete_id' => a3.id, 'event_id' => e1.id } )
event_register4 = EventRegister.new( { 'athlete_id' => a4.id, 'event_id' => e1.id } )
event_register5 = EventRegister.new( { 'athlete_id' => a5.id, 'event_id' => e1.id } )
event_register6 = EventRegister.new( { 'athlete_id' => a6.id, 'event_id' => e1.id } )

event_register7 = EventRegister.new( { 'athlete_id' => a1.id, 'event_id' => e2.id } )
event_register8 = EventRegister.new( { 'athlete_id' => a2.id, 'event_id' => e2.id } )
event_register9 = EventRegister.new( { 'athlete_id' => a3.id, 'event_id' => e2.id } )
event_register10 = EventRegister.new( { 'athlete_id' => a4.id, 'event_id' => e2.id } )
event_register11 = EventRegister.new( { 'athlete_id' => a5.id, 'event_id' => e2.id } )
event_register12 = EventRegister.new( { 'athlete_id' => a6.id, 'event_id' => e2.id } )
#
er1 = event_register1.save()
er2 = event_register2.save()
er3 = event_register3.save()
er4 = event_register4.save()
er5 = event_register5.save()
er6 = event_register6.save()
er7 = event_register7.save()
er8 = event_register8.save()
er9 = event_register9.save()
er10 = event_register10.save()
er11 = event_register11.save()
er12 = event_register12.save()


binding.pry
nil
