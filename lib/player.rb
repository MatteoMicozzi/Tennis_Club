class Player
  attr_reader :first_name, :last_name, :nationality, :date_of_birth
  attr_accessor :score, :rank_position, :rank_name, :games_played

 def initialize
    @first_name
    @last_name
    @nationality
    @date_of_birth
    @score = 1200
    @rank_position
    @rank_name = 'Unranked'
    @games_played = 0
  end

  def new(first_name, last_name, nationality, date_of_birth)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @nationality = nationality
    @date_of_birth = date_of_birth
  end
end
