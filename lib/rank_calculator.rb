def rank_detector(score, games_played)
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

def rank_calculator(first_name, last_name, players)
  players.map! { |player|
      player.rank_name = rank_detector(player.score, player.games_played) if (player.first_name == first_name) && (player.last_name == last_name)
      player
  }
end
