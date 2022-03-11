class Rank
  MINIMUM_MATCHES_FOR_RANKING = 3
  MINIMUM_SCORE_FOR_SILVER = 3000
  MINIMUM_SCORE_FOR_GOLD = 5000
  MINIMUM_SCORE_FOR_SUPERSONIC_LEGEND = 10000

  def detector(score, games_played)
    result =
      if games_played < MINIMUM_MATCHES_FOR_RANKING
        'Unranked'
      elsif score < MINIMUM_SCORE_FOR_SILVER
        'Bronze'
      elsif score < MINIMUM_SCORE_FOR_GOLD
        'Silver'
      elsif score < MINIMUM_SCORE_FOR_SUPERSONIC_LEGEND
        'Gold'
      else
        'Supersonic Legend'
      end
  end

  def calculator(player1_name, player2_name, players)
    players.map! { |player| player.rank_name = detector(player.score, player.games_played) if player.name == player1_name; player }
    players.map! { |player| player.rank_name = detector(player.score, player.games_played) if player.name == player2_name; player }
  end
end
