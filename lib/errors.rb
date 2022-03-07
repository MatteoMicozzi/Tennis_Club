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
  rescue PlayerDataEnteredError => error
    error_message(error)
  else
    return true
  end
end
