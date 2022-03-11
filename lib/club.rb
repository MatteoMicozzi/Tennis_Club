require_relative 'player'
require_relative 'errors'
require_relative 'sort'
require_relative 'game'
require_relative 'rank'

class Club
  attr_reader :players

  def initialize(printer = Printer.new, sort = Sort.new, rank = Rank.new, game = Game.new)
    @players = []
    @printer = printer
    @sort = sort
    @rank = rank
    @game = game
  end

  def new_player(first_name, last_name, nationality, date_of_birth, player = Player.new)
    if valid_new_player?(first_name, last_name, nationality, date_of_birth, @players)
      player.new("#{first_name.capitalize} #{last_name.capitalize}", nationality, date_of_birth)
      @players.push(player)
      @players = @sort.players_position(@players)
    end
  end

  def list_all_players()
    @printer.print_all(@players)
  end

  def list_players_ranked(rank_name)
    if valid_rank?(rank_name)
      @printer.print_ones_ranked(rank_name, @players)
    end
  end

  def list_players_from(nationality)
    if valid_nationality?(nationality)
      @printer.print_player_from(nationality, @players)
    end
  end

  def match(winner_name, winner_surname, loser_name, loser_surname)
    if valid_player?(winner_name.capitalize, winner_surname.capitalize, @players) && valid_player?(loser_name.capitalize, loser_surname.capitalize, @players)
      winner_name = "#{winner_name.capitalize} #{winner_surname.capitalize}"
      loser_name = "#{loser_name.capitalize} #{loser_surname.capitalize}"
      @game.match(winner_name, loser_name, @players)
      @rank.calculator(winner_name, loser_name, @players)
      @players = @sort.players_position(@players)
    end
  end
end
