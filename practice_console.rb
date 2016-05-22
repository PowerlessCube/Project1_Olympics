#Ruby play ground to check that SQL commands are working as intended.

require_relative( './models/nation' )
require_relative( './models/athlete' )

require( 'pry-byebug' )

Nation.delete_all
Athlete.delete_all

nation1 = Nation.new( { 'name' => 'Great Britain', 'acronym' => 'gbr', 'flag' => 'URL of GBR flag', 'athletes' => Array.new() } )
nation2 = Nation.new( { 'name' => 'Norway', 'acronym' => 'nor', 'flag' => 'URL of NOW flag', 'athletes' => Array.new() } )

n1 = nation1.save()
n2 = nation2.save()

athlete1 = Athlete.new( { 'name' => 'Bobby Runfast', 'nation_id' => n1.id } )
athlete2 = Athlete.new( { 'name' => 'Johny Jumphigh', 'nation_id' => n1.id } )
athlete3 = Athlete.new( { 'name' => 'Jorgen Throwfar', 'nation_id' => n2.id } )
athlete4 = Athlete.new( { 'name' => 'Borgen Swimfast', 'nation_id' => n2.id } )

a1 = athlete1.save()
a2 = athlete2.save()
a3 = athlete3.save()
a4 = athlete4.save()

binding.pry
nil
