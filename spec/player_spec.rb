require 'player'

describe Player do
  describe '#new' do
    it "will create a player profile" do
      subject.new('Tom Smith', 'British', '10-07-1983')
      expect(subject.name).to eq('Tom Smith')
      expect(subject.nationality).to eq('British')
      expect(subject.date_of_birth).to eq('10-07-1983')
    end
    it "will check the score points for a new player" do
      subject.new('Tom Smith', 'British', '10-07-1983')
      expect(subject.score).to eq(1200)
    end
  end
end
