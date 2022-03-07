require 'errors'

describe 'Errors' do
  describe '#new_Player_is_valid' do
    it 'will return false for integer in date of birth' do
      expect(new_player_is_valid("Jack", "Worren", "United States", 1983)).to eq(false)
    end
    it 'will return false for wrong character on name or surname' do
      expect(new_player_is_valid("J0ck", "Worren", "United States", "01-01-1983")).to eq(false)
      expect(new_player_is_valid("Jack", "W rren", "United States", "01-01-1983")).to eq(false)
    end
    it 'will return false for inexistent nationality' do
      expect(new_player_is_valid("Jack", "Worren", "United States", "01-01-1983")).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "Italian", "01-01-1983")).to eq(true)
    end
  end
end
