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
  describe '#list_all_players' do
    it "will return a list of all players" do
      subject.new_player('Tom', 'Huge', 'British', '10-07-1983')
      subject.new_player('Bill', 'Ford', "American", '11-09-1983')
      subject.new_player('Chill', 'Nill', "Mexican", '28-03-1990')
      expect(subject.list_all_players).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n1 | Chill Nill | 31 | Mexican | Unranked | 1200\n2 | Tom Huge | 38 | British | Unranked | 1200\n3 | Bill Ford | 38 | American | Unranked | 1200")
    end
  end
  describe '#list_players_ranked' do
    it "will return a list of all players ranked (Unranked)" do
      subject.new_player('Tom', 'Huge', 'British', '10-07-1983')
      subject.new_player('Bill', 'Ford', "American", '11-09-1983')
      subject.new_player('Chill', 'Nill', "Mexican", '28-03-1990')
      expect(subject.list_players_ranked('Unranked')).to eq("Rank Position | Name Surname | Age | Nationality | Ranking | Score\n1 | Chill Nill | 31 | Mexican | Unranked | 1200\n2 | Tom Huge | 38 | British | Unranked | 1200\n3 | Bill Ford | 38 | American | Unranked | 1200")
    end
  end
end
