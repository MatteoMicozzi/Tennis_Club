require 'printer'
require 'player'

def players_printer()
  tom = Player.new
  bill = Player.new
  tom.new('Tom Huge', 'British', '10-07-1983')
  bill.new('Bill Ford', "American", '11-09-1983')
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
      expect(subject.print_all(players_printer)).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n" \
                                                       "1 | Tom Huge | #{Age.new.now('10-07-1983')} | British | Bronze | 1000\n" \
                                                       "2 | Bill Ford | #{Age.new.now('11-09-1983')} | American | Unranked | 900")
    end
  end
  describe '#print_ones_ranked' do
    it "will print a list of all players with a specific rank name" do
      expect(subject.print_ones_ranked("Bronze", players_printer)).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n" \
                                                                         "1 | Tom Huge | #{Age.new.now('10-07-1983')} | British | Bronze | 1000")
      expect(subject.print_ones_ranked("Unranked", players_printer)).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n" \
                                                                           "2 | Bill Ford | #{Age.new.now('11-09-1983')} | American | Unranked | 900")
    end
  end
  describe '#print_players_from' do
    it "will print a list of all players with a specific nationality" do
      expect(subject.print_players_from('British', players_printer)).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n" \
                                                                          "1 | Tom Huge | #{Age.new.now('10-07-1983')} | British | Bronze | 1000")
      expect(subject.print_players_from('American', players_printer)).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n" \
                                                                           "2 | Bill Ford | #{Age.new.now('11-09-1983')} | American | Unranked | 900")
    end
  end
end
