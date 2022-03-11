require 'sort'
require 'club'

def players_sort()
  club = Club.new
  club.new_player('Tom', 'Smith', 'British', '10-07-1983')
  club.new_player('Rom', 'Smith', 'British', '10-07-1983')
  club.new_player('Com', 'Smith', 'British', '10-07-1983')
  club.players[0].score = 2
  club.players[1].score = 3
  club.players[2].score = 1
  return club
end

describe Sort do
  describe '#sort_players_by_points' do
    it "will sort players by their score in descending order" do
      club = players_sort()
      expect("1st: #{club.players[0].score}, " \
             "2nd: #{club.players[1].score}, " \
             "3rd: #{club.players[2].score}").to eq("1st: 2, 2nd: 3, 3rd: 1")
      players = subject.sort_players_by_points(club.players)
      expect("1st: #{players[0].score}, " \
             "2nd: #{players[1].score}, " \
             "3rd: #{players[2].score}").to eq("1st: 3, 2nd: 2, 3rd: 1")
    end
  end

  describe '#unranked_at_end' do
    it "will update the players order by positioning the unranked ones at the end" do
      club = players_sort()
      club.players[2].rank_name = 'Gold'
      players = subject.unranked_at_end(club.players)
      expect(players[2].rank_name).to eq('Unranked')
    end
  end

  describe '#players_position' do
    it "will update each player rank position" do
      club = players_sort()
      players = subject.players_position(club.players)
      expect("1st: #{players[0].rank_position}, " \
             "2nd: #{players[1].rank_position}, " \
             "3rd: #{players[2].rank_position}").to eq("1st: 1, 2nd: 2, 3rd: 3")
    end
  end
end
