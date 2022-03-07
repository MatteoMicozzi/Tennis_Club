def valid_name(name)
  characters = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm"
  letters = name.split(//)
  letters.each { |letter| return false unless characters.include?(letter) }
end
