require 'errors'
require 'player'

def players_errors()
  player = Player.new
  player.new("Jack Black", "American", "01-01-1983")
  [player]
end

describe 'Errors' do
  describe '#valid_new_player?' do
    it 'will return false for integer in date of birth' do
      expect(valid_new_player?("Jack", "Worren", "United States", 1983, players_errors())).to eq(false)
    end
    it 'will return false for wrong character on name or surname' do
      expect(valid_new_player?("J0ck", "Worren", "United States", "01-01-1983", players_errors())).to eq(false)
      expect(valid_new_player?("Jack", "W rren", "United States", "01-01-1983", players_errors())).to eq(false)
    end
    it 'will return false for inexistent nationality' do
      expect(valid_new_player?("Jack", "Worren", "United States", "01-01-1983", players_errors())).to eq(false)
    end
    it 'will return false for wrong date format' do
      expect(valid_new_player?("Jack", "Worren", "American", "01-31-1983", players_errors())).to eq(false)
      expect(valid_new_player?("Jack", "Worren", "American", "01-01-19838", players_errors())).to eq(false)
      expect(valid_new_player?("Jack", "Worren", "American", "01/01/1983", players_errors())).to eq(false)
    end
    it 'will return false for existent name' do
      expect(valid_new_player?("Jack", "Black", "American", "01-31-1983", players_errors())).to eq(false)
      expect(valid_new_player?("Jack", "Worren", "American", "01-01-1983", players_errors())).to eq(true)
    end
    it 'will return false for player younger than 16yo' do
      expect(valid_new_player?("Jack", "Worren", "American", "01-31-2020", players_errors())).to eq(false)
      expect(valid_new_player?("Jack", "Worren", "American", "01-01-1983", players_errors())).to eq(true)
    end
    it 'will return false for player older than 100yo' do
      expect(valid_new_player?("Jack", "Worren", "American", "01-31-1900", players_errors())).to eq(false)
      expect(valid_new_player?("Jack", "Worren", "American", "01-01-1983", players_errors())).to eq(true)
    end
  end

  describe '#valid_rank?' do
    it 'will return false for symbol instead of string' do
      expect(valid_rank?(:Gold)).to eq(false)
    end
    it 'will return false for a non rank name' do
      expect(valid_rank?('Platinum')).to eq(false)
    end
    it 'will return true for a real one: Unranked' do
      expect(valid_rank?('Unranked')).to eq(true)
    end
  end

  describe '#valid_nationality?' do
    it 'will return false for symbol instead of string' do
      expect(valid_nationality?(:American)).to eq(false)
    end
    it 'will return false for invalid nationality' do
      expect(valid_nationality?('UK')).to eq(false)
    end
    it 'will return true for a real one: American' do
      expect(valid_nationality?('American')).to eq(true)
    end
  end

  describe '#valid_player?' do
    it 'will return false for symbol instead of string' do
      expect(valid_player?(:Jack, :Black, players_errors())).to eq(false)
    end
    it 'will return false for a number instead of an alphaber letter' do
      expect(valid_player?('J4ck', 'Bl4ck', players_errors())).to eq(false)
    end
    it 'will return false for an inexistent player' do
      expect(valid_player?('Jack', 'Bullock', players_errors())).to eq(false)
    end
    it 'will return true for an existent player' do
      expect(valid_player?('Jack', 'Black', players_errors())).to eq(true)
    end
  end
end
