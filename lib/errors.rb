require_relative 'validations'

class PlayerDataEnteredError < StandardError; end
class NameTypedError < StandardError; end
class NationalityEnteredError < StandardError; end
class DateFormatError < StandardError; end
class DoubleNameError < StandardError; end
class PlayerAgeError < StandardError; end

def error_message(error)
  puts "A #{error.class} occurred: #{error.message}"
  return false
end

def new_player_is_valid(first_name, last_name, nationality, date_of_birth, players)
  begin
    raise PlayerDataEnteredError, "Please enter only strings!" unless (first_name.is_a? String) && (last_name.is_a? String) && (nationality.is_a? String) && (date_of_birth.is_a? String)
    raise NameTypedError, "Please enter valid name composed by alphabet letters!" unless valid_name(first_name) && valid_name(last_name)
    raise NationalityEnteredError, "Please enter a valid Nationality!" unless valid_nationality(nationality)
    raise DateFormatError, "Please enter a valid date format! DD-MM-YYYY" unless valid_date(date_of_birth)
    raise DoubleNameError, "Please enter a different name! Already exist!" unless inexistent_name(first_name, last_name, players)

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
  else
    return true
  end
end
