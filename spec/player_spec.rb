require 'player'

describe Player do
  describe '#new' do
    it "will create a player profile" do
      subject.new('Tom', 'Smith', 'England', '10-07-1983')
      expect(subject.first_name).to eq('Tom')
      expect(subject.last_name).to eq('Smith')
      expect(subject.nationality).to eq('England')
      expect(subject.date_of_birth).to eq('10-07-1983')
    end
    it "will ensure capitalization for name and surname" do
      subject.new('toM', 'smitH', 'England', '10-07-1983')
      expect(subject.first_name).to eq('Tom')
      expect(subject.last_name).to eq('Smith')
    end
  end
end
