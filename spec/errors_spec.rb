require 'errors'
require 'player'

def players_errors()
  player = Player.new
  player.new("Jack Black", "American", "01-01-1983")
  [player]
end

describe 'Errors' do
  describe '#new_Player_is_valid' do
    it 'will return false for integer in date of birth' do
      expect(new_player_is_valid("Jack", "Worren", "United States", 1983, players_errors())).to eq(false)
    end
    it 'will return false for wrong character on name or surname' do
      expect(new_player_is_valid("J0ck", "Worren", "United States", "01-01-1983", players_errors())).to eq(false)
      expect(new_player_is_valid("Jack", "W rren", "United States", "01-01-1983", players_errors())).to eq(false)
    end
    it 'will return false for inexistent nationality' do
      expect(new_player_is_valid("Jack", "Worren", "United States", "01-01-1983", players_errors())).to eq(false)
    end
    it 'will return false for wrong date format' do
      expect(new_player_is_valid("Jack", "Worren", "American", "01-31-1983", players_errors())).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01-01-19838", players_errors())).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01/01/1983", players_errors())).to eq(false)
    end
    it 'will return false for existent name' do
      expect(new_player_is_valid("Jack", "Black", "American", "01-31-1983", players_errors())).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01-01-1983", players_errors())).to eq(true)
    end
    it 'will return false for player younger than 16yo' do
      expect(new_player_is_valid("Jack", "Worren", "American", "01-31-2020", players_errors())).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01-01-1983", players_errors())).to eq(true)
    end
    it 'will return false for player older than 100yo' do
      expect(new_player_is_valid("Jack", "Worren", "American", "01-31-1900", players_errors())).to eq(false)
      expect(new_player_is_valid("Jack", "Worren", "American", "01-01-1983", players_errors())).to eq(true)
    end
  end

  describe '#rank_name_is_valid' do
    it 'will return false for symbol instead of string' do
      expect(rank_name_is_valid(:Gold)).to eq(false)
    end
    it 'will return false for a non rank name' do
      expect(rank_name_is_valid('Platinum')).to eq(false)
    end
    it 'will return true for a real one: Unranked' do
      expect(rank_name_is_valid('Unranked')).to eq(true)
    end
  end

  describe '#nationality_is_valid' do
    it 'will return false for symbol instead of string' do
      expect(nationality_is_valid(:American)).to eq(false)
    end
    it 'will return false for invalid nationality' do
      expect(nationality_is_valid('UK')).to eq(false)
    end
    it 'will return true for a real one: American' do
      expect(nationality_is_valid('American')).to eq(true)
    end
  end

  describe '#player_is_valid' do
    it 'will return false for symbol instead of string' do
      expect(player_is_valid(:Jack, :Black, players_errors())).to eq(false)
    end
    it 'will return false for a number instead of an alphaber letter' do
      expect(player_is_valid('J4ck', 'Bl4ck', players_errors())).to eq(false)
    end
    it 'will return false for an inexistent player' do
      expect(player_is_valid('Jack', 'Bullock', players_errors())).to eq(false)
    end
    it 'will return true for an existent player' do
      expect(player_is_valid('Jack', 'Black', players_errors())).to eq(true)
    end
  end
end
