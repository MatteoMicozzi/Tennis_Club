require 'printer'
require 'player'

def players
  tom = Player.new
  bill = Player.new
  tom.new('Tom', 'Huge', 'British', '10-07-1983')
  bill.new('Bill', 'Ford', "American", '11-09-1983')
  tom.rank_position = 1
  bill.rank_position = 2
  tom.rank_name = 'Bronze'
  bill.rank_name = 'Unranked'
  tom.score = 1000
  bill.score = 900
  [tom, bill]
end


describe Printer do
  describe '#print_all' do
    it "will print a list of all players" do
      expect(subject.print_all(players)).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n1 | Tom Huge | #{age('10-07-1983')} | British | Bronze | 1000\n2 | Bill Ford | #{age('11-09-1983')} | American | Unranked | 900")
    end
  end
end
