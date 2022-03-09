require 'age'

describe '#age' do
  it "will give back the age from birthday date" do
    expect(age('01-01-1990', Time.local(2000, 1, 2))).to eq(10)
  end
end
