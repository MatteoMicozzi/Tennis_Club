require 'age'

describe Age do
  describe '#now' do
    it "will give back the age from birthday date" do
      expect(subject.now('01-01-1990', Time.local(2000, 1, 1))).to eq(10)
    end
  end
end
