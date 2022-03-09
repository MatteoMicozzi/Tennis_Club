require_relative 'player'
require_relative 'rank_calculator'

class Club
  attr_reader :players

  def initialize(printer = Printer.new)
    @players = []
    @printer = printer
  end

  def unranked_at_end(players)
    ranked = []
    unranked = []
    players.each { |player| player.rank_name == 'Unranked' ? unranked << player : ranked << player }
    return ranked + unranked
  end

  def update_player_position(players)
    players = unranked_at_end(players)
    position = 1
    players.map! { |player|
        player.rank_position = position
        position += 1
        player
      }
    return players
  end

  def sort_players(players)
    players.sort_by!(&:score).reverse!
    return update_player_position(players)
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    if new_player_is_valid(first_name, last_name, nationality, date_of_birth, @players)
      player.new(first_name, last_name, nationality, date_of_birth)
      @players.push(player)
      @players = sort_players(@players)
    end
  end

  def list_all_players()
    @printer.print_all(@players)
  end

  def list_players_ranked(rank_name)
    if rank_name_is_valid(rank_name)
      @printer.print_ones_ranked(rank_name, @players)
    end
  end

  def list_players_from(nationality)
    if nationality_is_valid(nationality)
      @printer.print_player_from(nationality, @players)
    end
  end
end
