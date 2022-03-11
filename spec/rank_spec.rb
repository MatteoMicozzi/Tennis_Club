require 'rank'
require 'player'

def players_rank()
  tom = Player.new
  bill = Player.new
  tom.new('Tom Huge', 'British', '10-07-1983')
  bill.new('Bill Ford', "American", '11-09-1983')
  tom.rank_name = 'Gold'
  bill.rank_name = 'Unranked'
  tom.score = 100000
  bill.score = 4000
  tom.games_played = 100
  bill.games_played = 30
  [tom, bill]
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
      TOM = 0
      BILL = 1
      players = players_rank()
      subject.calculator('Tom Huge', 'Bill Ford',  players)
      expect(players[TOM].rank_name).to eq('Supersonic Legend')
      expect(players[BILL].rank_name).to eq('Silver')
    end
  end
end
