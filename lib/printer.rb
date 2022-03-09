require_relative 'age'

class Printer
  def print_all(players)
    list = ['Rank Position | Name Surname | Age | Nationality | Ranking | Score']
    players.each { |player| list << "#{player.rank_position} | #{player.first_name} #{player.last_name} | #{age(player.date_of_birth)} | #{player.nationality} | #{player.rank_name} | #{player.score}" }
    list.join("\n")
  end

  def print_ones_ranked(rank_name, players)
    list = ['Rank Position | Name Surname | Age | Nationality | Ranking | Score']
    players.each { |player| list << "#{player.rank_position} | #{player.first_name} #{player.last_name} | #{age(player.date_of_birth)} | #{player.nationality} | #{player.rank_name} | #{player.score}" if player.rank_name == rank_name }
    return "No Players has #{rank_name}!" if list.size == 1
    list.join("\n")
  end
end
