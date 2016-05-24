require_relative( '../models/medal_table' )
# TODO: 7 restful routes: GET /MedalTable INDEX
get '/medal_table' do
  @medal_table = MedalTable.new
  erb :'medal_tables/index'
end
