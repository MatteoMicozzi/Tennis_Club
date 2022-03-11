require_relative 'rank'

class Game
  ONE_MATCH = 1
  TEN_PERCENT = 0.1

  def initialize(rank = Rank.new)
    @rank = rank
  end

  def played_one(player1_name, player2_name, players)
    players.map! { |player| player.games_played += (ONE_MATCH) if player.name == player1_name; player }
    players.map! { |player| player.games_played += (ONE_MATCH) if player.name == player2_name; player }
  end

  def ten_percent_score(name, players)
    players.each { |player| return (player.score * (TEN_PERCENT)).floor if player.name == name }
  end

  def match(winner_name, loser_name, players)
    ten_percent_loser = ten_percent_score(loser_name, players)
    played_one(winner_name, loser_name, players)
    players.map! { |player| player.score += ten_percent_loser if player.name == winner_name; player }
    players.map! { |player| player.score -= ten_percent_loser if player.name == loser_name; player }
    @rank.calculator(winner_name, loser_name, players)
  end
end
