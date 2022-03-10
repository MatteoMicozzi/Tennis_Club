class Game
  def played_one(name, players)
    players.map! { |player| player.games_played += 1; player }
  end

  def ten_percent(name, players)
    players.each { |player| return (player.score * 0.1).floor if player.name == name }
  end

  def match(winner_name, loser_name, players)

  end
end
