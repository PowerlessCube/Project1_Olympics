require( 'pry-byebug' )

require_relative( '../models/nation' )
require_relative( '../models/event' )
require_relative( '../models/athlete' )


class MedalTable
  attr_accessor :nations

  def initialize(  )
    @nations = Nation.all
  end

  def display_flag( nation )
    return nation.flag
  end

  def display_acronym( nation )
    return nation.acronym
  end

  def display_name( nation )
    return nation.name
  end

  def display_gold_medal_count( nation )
    return nation.gold_medals.count
  end

  def display_silver_medal_count( nation )
    return nation.silver_medals.count
  end

  def display_bronze_medal_count( nation )
    return nation.bronze_medals.count
  end

  def gold_points( nation )
    return nation.gold_medals.count * 5
  end

  def silver_points( nation )
    return nation.silver_medals.count * 3
  end

  def bronze_points(nation)
    return nation.bronze_medals.count * 1
  end

  def total_points( nation )
    return gold_points( nation ) + silver_points( nation ) + bronze_points( nation )
  end


end

nil
