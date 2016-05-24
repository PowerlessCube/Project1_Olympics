require( 'pry-byebug' )
require_relative( '../models/medal_table' )

# GET /MedalTable INDEX
get '/medal_table' do
  @medal_table = MedalTable.new
  erb :'medal_tables/index'
end
