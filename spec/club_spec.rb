require 'club'

describe Club do
  describe '#new_player' do
    it "will add a player into the players list" do
      subject.new_player('Tom', 'Smith', 'England', '10-07-1983')
      expect(subject.players[0].is_a? Player).to eq(true)
    end
  end
end
