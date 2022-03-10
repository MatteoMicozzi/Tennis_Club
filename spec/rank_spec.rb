require 'rank'
require 'player'

def tom
  tom = Player.new
  tom.new('Tom Huge', 'British', '10-07-1983')
  tom.rank_position = 1
  tom.rank_name = 'Gold'
  tom.score = 100000
  tom.games_played = 100
  [tom]
end

describe Rank do
  describe '#rank_detector' do
    it "will give back the right rank name" do
      expect(subject.detector(3500, 2)).to eq('Unranked')
      expect(subject.detector(2000, 3)).to eq('Bronze')
      expect(subject.detector(4000, 3)).to eq('Silver')
      expect(subject.detector(5000, 3)).to eq('Gold')
      expect(subject.detector(100000, 3)).to eq('Supersonic Legend')
    end
  end
  describe '#rank_calculator' do
    it "will check for the changed rank name" do
      players = tom
      subject.calculator('Tom Huge', players)
      expect(players[0].rank_name).to eq('Supersonic Legend')
    end
  end
end
