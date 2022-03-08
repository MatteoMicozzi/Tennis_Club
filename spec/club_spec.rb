require 'club'

def entering_new_players()
  subject.new_player('Tom', 'Smith', 'British', '10-07-1983')
  subject.new_player('Rom', 'Smith', 'British', '10-07-1983')
  subject.new_player('Com', 'Smith', 'British', '10-07-1983')
  subject.players[0].score = 2
  subject.players[1].score = 3
  subject.players[2].score = 1
end

describe Club do
  describe '#new_player' do
    it "will add a player into the players list" do
      subject.new_player('Tom', 'Smith', 'British', '10-07-1983')
      expect(subject.players[0].is_a? Player).to eq(true)
    end
    it "will add just the first player of the same" do
      subject.new_player('Tom', 'Smith', 'British', '10-07-1983')
      subject.new_player('Tom', 'Smith', 'British', '10-07-1983')
      expect(subject.players.length).to eq(1)
      subject.new_player('Tommy', 'Smith', 'British', '10-07-1983')
      expect(subject.players.length).to eq(2)
    end
  end
  describe '#sort_players' do
    it "will sort players by their score in descending order" do
      entering_new_players()
      expect("1st: #{subject.players[0].score}, 2nd: #{subject.players[1].score}, 3rd: #{subject.players[2].score}").to eq("1st: 2, 2nd: 3, 3rd: 1")
      subject.sort_players
      expect("1st: #{subject.players[0].score}, 2nd: #{subject.players[1].score}, 3rd: #{subject.players[2].score}").to eq("1st: 3, 2nd: 2, 3rd: 1")
    end
  end
  describe '#update_player_position' do
    it "will update each player rank position in ascending order by points" do
      entering_new_players()
      expect("1st: #{subject.players[0].score}, 2nd: #{subject.players[1].score}, 3rd: #{subject.players[2].score}").to eq("1st: 2, 2nd: 3, 3rd: 1")
      subject.sort_players
      expect("Position #{subject.players[0].rank_position}: #{subject.players[0].score}, Position #{subject.players[1].rank_position}: #{subject.players[1].score}, Position #{subject.players[2].rank_position}: #{subject.players[2].score}").to eq("Position 1: 3, Position 2: 2, Position 3: 1")
    end
  end
  describe '#unranked_at_end' do
    it "will update the players order by positioning the unranked ones at the end" do
      entering_new_players()
      subject.players[2].rank_name = 'Gold'
      subject.unranked_at_end
      expect(subject.players[2].rank_name).to eq('Unranked')
    end
  end
end
