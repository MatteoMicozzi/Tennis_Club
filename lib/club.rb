require_relative 'player'

class Club
  attr_reader :players

  def initialize
    @players = []
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    player.new(first_name, last_name, nationality, date_of_birth)
    @players.push(player)
  end
end
