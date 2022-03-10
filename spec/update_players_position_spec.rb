require 'update_players_position'
require 'club'

def club_with_players()
  club = Club.new
  club.new_player('Tom', 'Smith', 'British', '10-07-1983')
  club.new_player('Rom', 'Smith', 'British', '10-07-1983')
  club.new_player('Com', 'Smith', 'British', '10-07-1983')
  club.players[0].score = 2
  club.players[1].score = 3
  club.players[2].score = 1
  return club
end


describe '#sort_players_by_points' do
  it "will sort players by their score in descending order" do
    club = club_with_players()
    expect("1st: #{club.players[0].score}, 2nd: #{club.players[1].score}, 3rd: #{club.players[2].score}").to eq("1st: 2, 2nd: 3, 3rd: 1")
    players = sort_players_by_points(club.players)
    expect("1st: #{players[0].score}, 2nd: #{players[1].score}, 3rd: #{players[2].score}").to eq("1st: 3, 2nd: 2, 3rd: 1")
  end
end

describe '#unranked_at_end' do
  it "will update the players order by positioning the unranked ones at the end" do
    club = club_with_players()
    club.players[2].rank_name = 'Gold'
    players = unranked_at_end(club.players)
    expect(players[2].rank_name).to eq('Unranked')
  end
end

describe '#update_players_position' do
  it "will update each player rank position" do
    club = club_with_players()
    players = update_players_position(club.players)
    expect("1st: #{players[0].rank_position}, 2nd: #{players[1].rank_position}, 3rd: #{players[2].rank_position}").to eq("1st: 1, 2nd: 2, 3rd: 3")
  end
end
