require 'errors'

describe 'Errors' do
  describe '#new_Player_is_valid' do
    it 'will return false for integer in date of birth' do
      expect(new_player_is_valid("Jack", "Worren", "United States", 1983)).to eq(false)
    end
  end
end
