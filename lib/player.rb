class Player
  attr_reader :name, :nationality, :date_of_birth
  attr_accessor :score, :rank_position, :rank_name, :games_played
  STARTING_SCORE = 1200
  STARTING_RANK = 'Unranked'
  NONE = 0

 def initialize
    @name
    @nationality
    @date_of_birth
    @score = STARTING_SCORE
    @rank_position
    @rank_name = STARTING_RANK
    @games_played = NONE
  end

  def new(name, nationality, date_of_birth)
    @name = name
    @nationality = nationality
    @date_of_birth = date_of_birth
  end
end
