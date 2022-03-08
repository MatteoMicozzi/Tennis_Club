require 'club'

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
  describe '#sort_by_score' do
    it "will sort players by their score in descending order" do
      subject.new_player('Tom', 'Smith', 'British', '10-07-1983')
      subject.new_player('Rom', 'Smith', 'British', '10-07-1983')
      subject.new_player('Com', 'Smith', 'British', '10-07-1983')
      subject.players[0].score = 2
      subject.players[1].score = 3
      subject.players[2].score = 1
      expect("1st: #{subject.players[0].score}, 2nd: #{subject.players[1].score}, 3rd: #{subject.players[2].score}").to eq("1st: 2, 2nd: 3, 3rd: 1")
      subject.sort_players
      expect("1st: #{subject.players[0].score}, 2nd: #{subject.players[1].score}, 3rd: #{subject.players[2].score}").to eq("1st: 3, 2nd: 2, 3rd: 1")
    end
  end
end
