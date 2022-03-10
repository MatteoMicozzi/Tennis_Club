def sort_players_by_points(players)
  players.sort_by!(&:score).reverse!
  return players
end

def unranked_at_end(players)
  players = sort_players_by_points(players)
  ranked = []
  unranked = []
  players.each { |player| player.rank_name == 'Unranked' ? unranked << player : ranked << player }
  return ranked + unranked
end

def update_players_position(players)
  players = unranked_at_end(players)
  position = 1
  players.map! { |player|
      player.rank_position = position
      position += 1
      player
    }
  return players
end
