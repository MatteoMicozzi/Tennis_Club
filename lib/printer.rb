require_relative 'age'

class Printer
  EMPTY = 1
  HEADER = 'Rank Position | Name Surname | Age | Nationality | Ranking | Score'

  def initialize(age = Age.new)
    @age = age
  end

  def print_all(players)
    list = [HEADER]
    players.each { |player| list << "#{player.rank_position} | #{player.name} | " \
                                    "#{@age.now(player.date_of_birth)} | #{player.nationality} | " \
                                    "#{player.rank_name} | #{player.score}" }
    return "No Players are in the Club!" if list.size == EMPTY
    list.join("\n")
  end

  def print_ones_ranked(rank_name, players)
    list = [HEADER]
    players.each { |player| list << "#{player.rank_position} | #{player.name} | " \
                                    "#{@age.now(player.date_of_birth)} | #{player.nationality} | " \
                                    "#{player.rank_name} | #{player.score}" if player.rank_name == rank_name }
    return "No Players has Rank #{rank_name}!" if list.size == EMPTY
    list.join("\n")
  end

  def print_players_from(nationality, players)
    list = [HEADER]
    players.each { |player| list << "#{player.rank_position} | #{player.name} | " \
                                    "#{@age.now(player.date_of_birth)} | #{player.nationality} | " \
                                    "#{player.rank_name} | #{player.score}" if player.nationality == nationality }
    return "No Players has #{nationality} nationality!" if list.size == EMPTY
    list.join("\n")
  end
end
