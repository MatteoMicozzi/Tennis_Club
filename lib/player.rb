class Player
  attr_reader :name, :nationality, :date_of_birth
  attr_accessor :score, :rank_position, :rank_name, :games_played

 def initialize
    @name
    @nationality
    @date_of_birth
    @score = 1200
    @rank_position
    @rank_name = 'Unranked'
    @games_played = 0
  end

  def new(name, nationality, date_of_birth)
    @name = name
    @nationality = nationality
    @date_of_birth = date_of_birth
  end
end
