class Game
  def played_one(name, players)
    players.map! { |player| player.games_played += 1; player }
  end

  def ten_percent(name, players)

  end

  def match(winner_name, loser_name, players)

  end
end
