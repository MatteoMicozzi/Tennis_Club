class Rank
  def detector(score, games_played)
    if games_played < 3
      return 'Unranked'
    elsif score < 3000
      return 'Bronze'
    elsif score < 5000
      return 'Silver'
    elsif score < 10000
      return 'Gold'
    else
      return 'Supersonic Legend'
    end
  end

  def calculator(name, players)
    players.map! { |player| player.rank_name = detector(player.score, player.games_played) if player.name == name; player }
  end
end
