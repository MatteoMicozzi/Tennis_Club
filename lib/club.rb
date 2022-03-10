require_relative 'player'
require_relative 'update_players_position'
require_relative 'rank_calculator'

class Club
  attr_reader :players

  def initialize(printer = Printer.new)
    @players = []
    @printer = printer
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    if new_player_is_valid(first_name, last_name, nationality, date_of_birth, @players)
      player.new("#{first_name.capitalize} #{last_name.capitalize}", nationality, date_of_birth)
      @players.push(player)
      @players = update_players_position(@players)
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
