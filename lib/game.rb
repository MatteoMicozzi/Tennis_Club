class Game
  def played_one(winner_name, loser_name, players)
    players.map! { |player| player.games_played += 1 if player.name == winner_name; player }
    players.map! { |player| player.games_played += 1 if player.name == loser_name; player }
  end

  def ten_percent_score(name, players)
    players.each { |player| return (player.score * 0.1).floor if player.name == name }
  end

  def match(winner_name, loser_name, players)
    ten_percent_loser = ten_percent_score(loser_name, players)
    played_one(winner_name, loser_name, players)
    players.map! { |player| player.score += ten_percent_loser if player.name == winner_name; player }
    players.map! { |player| player.score -= ten_percent_loser if player.name == loser_name; player }
  end
end
