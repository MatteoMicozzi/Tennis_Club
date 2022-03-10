require 'game'

def players()
  tom = Player.new
  bill = Player.new
  tom.new('Tom Huge', 'British', '10-07-1983')
  bill.new('Bill Ford', "American", '11-09-1983')
  tom.score = 1000
  bill.score = 900
  [tom, bill]
end

describe Game do
  describe '#played_one' do
    it "will add 1 to player.games_played" do
      players = players()
      expect(players[0].games_played).to eq(0)
      subject.played_one('Tom Huge', players)
      expect(players[0].games_played).to eq(1)
    end
  end
  describe '#ten_percent' do
    it "will calculate the 10% of the player score" do
      players = players()
      expect(subject.ten_percent('Tom Huge', players)).to eq(100)
    end
  end
  describe '#match' do
    it "will subtract 10% of score to the loser to give it to the winner" do
      players = players()
      subject.match('Tom Huge', 'Bill Ford', players)
      expect(players[0].score).to eq(1090)
      expect(players[1].score).to eq(810)
    end
  end
end
