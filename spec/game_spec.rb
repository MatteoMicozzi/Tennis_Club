require 'game'

def players_game()
  tom = Player.new
  bill = Player.new
  chill = Player.new
  tom.new('Tom Huge', 'British', '10-07-1983')
  bill.new('Bill Ford', "American", '11-09-1983')
  chill.new('Chill Nill', "Mexican", '28-03-1990')
  tom.score = 1000
  bill.score = 900
  chill.score = 1100
  [tom, bill, chill]
end

describe Game do
  describe '#played_one' do
    it "will add 1 to player.games_played" do
      players = players_game()
      expect(players[0].games_played).to eq(0)
      subject.played_one('Tom Huge', 'Bill Ford', players)
      expect(players[0].games_played).to eq(1)
      expect(players[1].games_played).to eq(1)
      expect(players[2].games_played).to eq(0)
    end
  end
  describe '#ten_percent_score' do
    it "will calculate the 10% of the player score" do
      players = players_game()
      expect(subject.ten_percent_score('Tom Huge', players)).to eq(100)
    end
  end
  describe '#match' do
    it "will subtract 10% of score to the loser to give it to the winner" do
      TOM = 0
      BILL = 1
      players = players_game()
      subject.match('Tom Huge', 'Bill Ford', players)
      expect(players[TOM].score).to eq(1090)
      expect(players[BILL].score).to eq(810)
    end
  end
end
