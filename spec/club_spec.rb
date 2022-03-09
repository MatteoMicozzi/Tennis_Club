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
end
