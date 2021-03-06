require_relative 'validations'
require_relative 'age'

MINIMUM_AGE = 16
MAXIMUM_AGE = 100

class PlayerDataEnteredError < StandardError; end
class NameTypedError < StandardError; end
class NationalityEnteredError < StandardError; end
class DateFormatError < StandardError; end
class DoubleNameError < StandardError; end
class PlayerAgeError < StandardError; end
class RankDataEnteredError < StandardError; end
class RankNameEnteredError < StandardError; end
class InexistentNameError < StandardError; end

def error_message(error)
  puts "A #{error.class} occurred: #{error.message}"
  return false
end

def valid_new_player?(first_name, last_name, nationality, date_of_birth, players, age = Age.new)
  begin
    raise PlayerDataEnteredError, "Please enter only strings!" \
      "" unless (first_name.is_a? String) && (last_name.is_a? String) && (nationality.is_a? String) && (date_of_birth.is_a? String)
    raise NameTypedError, "Please enter valid name composed by alphabet letters!" \
      "" unless valid_name?(first_name) && valid_name?(last_name)
    raise NationalityEnteredError, "Please enter a valid Nationality!" unless valid_nationality_name?(nationality)
    raise DateFormatError, "Please enter a valid date format! DD-MM-YYYY" unless valid_date?(date_of_birth)
    raise DoubleNameError, "Please enter a different name! Already exist!" if existent_name?(first_name, last_name, players)
    raise PlayerAgeError, "Player too young! At least 16 years old!" unless age.now(date_of_birth) >= MINIMUM_AGE
    raise PlayerAgeError, "Invalid year entry! Too old!" unless age.now(date_of_birth) < MAXIMUM_AGE
  rescue PlayerDataEnteredError => error
    error_message(error)
  rescue NameTypedError => error
    error_message(error)
  rescue NationalityEnteredError => error
    error_message(error)
  rescue DateFormatError => error
    error_message(error)
  rescue DoubleNameError => error
    error_message(error)
  rescue PlayerAgeError => error
    error_message(error)
  else
    return true
  end
end

def valid_rank?(rank_name)
  begin
    raise RankDataEnteredError, "Please enter a string!" unless rank_name.is_a? String
    raise RankNameEnteredError, "Please enter a valid Rank Name! Choose from: " \
                                "Unranked, Bronze, Silver, Gold, Supersonic Legend" unless valid_rank_name?(rank_name)
  rescue RankDataEnteredError => error
    error_message(error)
  rescue RankNameEnteredError => error
    error_message(error)
  else
    return true
  end
end

def valid_nationality?(nationality)
  begin
    raise NationalityEnteredError, "Please enter a string!" unless nationality.is_a? String
    raise NationalityEnteredError, "Please enter a valid Nationality!" unless valid_nationality_name?(nationality)
  rescue NationalityEnteredError => error
    error_message(error)
  else
    return true
  end
end

def valid_player?(first_name, last_name, players)
  begin
    raise PlayerDataEnteredError, "Please enter only strings!" unless (first_name.is_a? String) && (last_name.is_a? String)
    raise NameTypedError, "Please enter valid name composed by alphabet letters!" \
      "" unless valid_name?(first_name) && valid_name?(last_name)
    raise InexistentNameError, "Please enter a valid player name! Doesn't exist!" \
      "" if not existent_name?(first_name, last_name, players)
  rescue PlayerDataEnteredError => error
    error_message(error)
  rescue NameTypedError => error
    error_message(error)
  rescue InexistentNameError => error
    error_message(error)
  else
    return true
  end
end
