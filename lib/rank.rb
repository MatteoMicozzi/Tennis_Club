class Rank
  MINIMUM_MATCHES_FOR_RANKING = 3
  MINIMUM_SCORE_FOR_SILVER = 3000
  MINIMUM_SCORE_FOR_GOLD = 5000
  MINIMUM_SCORE_FOR_SUPERSONIC_LEGEND = 10000

  def detector(score, games_played)
    if games_played < MINIMUM_MATCHES_FOR_RANKING
      return 'Unranked'
    elsif score < MINIMUM_SCORE_FOR_SILVER
      return 'Bronze'
    elsif score < MINIMUM_SCORE_FOR_GOLD
      return 'Silver'
    elsif score < MINIMUM_SCORE_FOR_SUPERSONIC_LEGEND
      return 'Gold'
    else
      return 'Supersonic Legend'
    end
  end

  def calculator(player_name_1, player_name_2, players)
    players.map! { |player| player.rank_name = detector(player.score, player.games_played) if player.name == player_name_1; player }
    players.map! { |player| player.rank_name = detector(player.score, player.games_played) if player.name == player_name_2; player }
  end
end
