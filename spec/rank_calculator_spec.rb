require 'rank_calculator'
require 'player'

def tom
  tom = Player.new
  tom.new('Tom', 'Huge', 'British', '10-07-1983')
  tom.rank_position = 1
  tom.rank_name = 'Gold'
  tom.score = 100000
  tom.games_played = 100
  [tom]
end

describe 'Calculate the rank name' do
  describe '#rank_detector' do
    it "will give back the right rank name" do
      expect(rank_detector(3500, 2)).to eq('Unranked')
      expect(rank_detector(2000, 3)).to eq('Bronze')
      expect(rank_detector(4000, 3)).to eq('Silver')
      expect(rank_detector(5000, 3)).to eq('Gold')
      expect(rank_detector(100000, 3)).to eq('Supersonic Legend')
    end
  end
  describe '#rank_calculator' do
    it "will check for the changed rank name" do
      players = tom
      rank_calculator('Tom', 'Huge', players)
      expect(players[0].rank_name).to eq('Supersonic Legend')
    end
  end
end
