require 'errors'
require 'player'

describe 'Errors' do
  describe '#new_Player_is_valid' do
    players = []
    player = Player.new
    player.new("Jack", "Black", "American", "01-01-1983")
    players << player

    it 'will return false for integer in date of birth' do
      expect(new_player_is_valid("Jack", "Worren", "United States", 1983, players)).to eq(false)
    end
    it 'will return false for wrong character on name or surname' do
      expect(new_player_is_valid("J0ck", "Worren", "United States", "01-01-1983", players)).to eq(false)
      expect(new_player_is_valid("Jack", "W rren", "United States", "01-01-1983", players)).to eq(false)
    end
    it 'will return false for inexistent nationality' do
      expect(new_player_is_valid("Jack", "Worren", "United States", "01-01-1983", players)).to eq(false)
    end
    it 'will return false for wrong date format' do
      expect(new_player_is_valid("Jack", "Worren", "American", "01-31-1983", players)).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01-01-19838", players)).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01/01/1983", players)).to eq(false)
    end
    it 'will return false for existent name' do
      expect(new_player_is_valid("Jack", "Black", "American", "01-31-1983", players)).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01-01-1983", players)).to eq(true)
    end
  end
end
