require_relative 'validations'

class PlayerDataEnteredError < StandardError; end
class NameTypedError < StandardError; end
class NationalityEnteredError < StandardError; end
class DateFormatError < StandardError; end
class NameEnteredError < StandardError; end
class PlayerAgeError < StandardError; end

def error_message(error)
  puts "A #{error.class} occurred: #{error.message}"
  return false
end

def new_player_is_valid(first_name, last_name, nationality, date_of_birth)
  begin
    raise PlayerDataEnteredError, "Please enter only strings!" unless (first_name.is_a? String) && (last_name.is_a? String) && (nationality.is_a? String) && (date_of_birth.is_a? String)
    raise NameTypedError, "Please enter valid name and/or surname composed by alphabet letters!" unless valid_name(first_name) && valid_name(last_name)
    raise NationalityEnteredError, "Please enter a valid Nationality!" unless valid_nationality(nationality)

  rescue PlayerDataEnteredError => error
    error_message(error)
  rescue NameTypedError => error
    error_message(error)
  rescue NationalityEnteredError => error
    error_message(error)
  else
    return true
  end
end
