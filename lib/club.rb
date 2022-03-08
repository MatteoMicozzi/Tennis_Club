require_relative 'player'

class Club
  attr_reader :players

  def initialize
    @players = []
  end

  def update_rank_position
    position = 1
    @players.each { |player|
        player.rank_position = position
        position += 1
    }
  end

  def sort_players
    @players.sort_by!(&:score).reverse!
    update_rank_position
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    if new_player_is_valid(first_name, last_name, nationality, date_of_birth, @players)
      player.new(first_name, last_name, nationality, date_of_birth)
      @players.push(player)
      sort_players
    end
  end
end
