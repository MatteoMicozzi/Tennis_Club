require_relative 'player'

class Club
  attr_reader :players

  def initialize(printer = Printer.new)
    @players = []
    @printer = printer
  end

  def unranked_at_end()
    ranked = []
    unranked = []
    @players.each { |player| player.rank_name == 'Unranked' ? unranked << player : ranked << player }
    @players = ranked + unranked
  end

  def update_player_position()
    unranked_at_end()
    position = 1
    @players.each { |player|
        player.rank_position = position
        position += 1
      }
  end

  def sort_players()
    @players.sort_by!(&:score).reverse!
    update_player_position()
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    if new_player_is_valid(first_name, last_name, nationality, date_of_birth, @players)
      player.new(first_name, last_name, nationality, date_of_birth)
      @players.push(player)
      sort_players()
    end
  end

  def list_all_players()
    sort_players()
    @printer.print_all(@players)
  end
end
