require_relative 'player'

class Club
  attr_reader :players

  def initialize
    @players = []
  end

  def sort_players
    @players.sort_by!(&:score).reverse!
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    if new_player_is_valid(first_name, last_name, nationality, date_of_birth, @players)
      player.new(first_name, last_name, nationality, date_of_birth)
      @players.push(player)
    end
  end
end
