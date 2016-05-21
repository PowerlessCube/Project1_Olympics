#Ruby play ground to check that SQL commands are working as intended.

require_relative( './models/nation' )

require( 'pry-byebug' )

Nation.delete_all

nation1 = Nation.new( { 'name' => 'Great Britain', 'acronym' => 'gbr', 'flag' => 'URL of GBR flag', 'athletes' => Array.new() } )

n1 = nation1.save()

binding.pry
nil
