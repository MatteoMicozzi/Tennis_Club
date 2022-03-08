def age(date_of_birth, time_now = Time.now)
  date = date_of_birth.split('-')
  time_birthday = Time.local(date[2].to_i, date[1].to_i, date[0].to_i)
  seconds = time_now - time_birthday
  age = (((seconds/ 60)/ 60)/ 24)/ 365
  age.floor
end
