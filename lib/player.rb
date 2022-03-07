class Player
  attr_reader :first_name, :last_name, :nationality, :date_of_birth

 def initialize
    @first_name
    @last_name
    @nationality
    @date_of_birth
  end

  def new(first_name, last_name, nationality, date_of_birth)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @nationality = nationality
    @date_of_birth = date_of_birth
  end
end
