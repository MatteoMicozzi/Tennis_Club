require_relative 'player'
require_relative 'errors'
require_relative 'update_players_position'
require_relative 'game'
require_relative 'rank'

class Club
  attr_reader :players

  def initialize(printer = Printer.new, game = Game.new, rank = Rank.new)
    @players = []
    @printer = printer
    @game = game
    @rank = rank
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

  def match(winner_name, winner_surname, loser_name, loser_surname)
    if player_is_valid(winner_name.capitalize, winner_surname.capitalize, @players) && player_is_valid(loser_name.capitalize, loser_surname.capitalize, @players)
      @game.played_one("#{winner_name.capitalize} #{winner_surname.capitalize}", @players)
      @game.played_one("#{loser_name.capitalize} #{loser_surname.capitalize}", @players)
      @game.match("#{winner_name.capitalize} #{winner_surname.capitalize}", "#{loser_name.capitalize} #{loser_surname.capitalize}", @players)
      @rank.calculator("#{winner_name.capitalize} #{winner_surname.capitalize}", @players)
      @rank.calculator("#{loser_name.capitalize} #{loser_surname.capitalize}", @players)
    end
  end
end
