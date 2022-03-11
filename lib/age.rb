class Age
  SECONDS_MINUTE = 60
  MINUTES_HOUR = 60
  HOURS_DAY = 24
  DAYS_YEAR = 365
  YEAR = 2
  MONTH = 1
  DAY = 0

  def now(date_of_birth, time_now = Time.now)
    dob = date_of_birth.split('-')
    seconds_from_dob = time_now - Time.local(dob[YEAR].to_i, dob[MONTH].to_i, dob[DAY].to_i)
    (((((seconds_from_dob)/ SECONDS_MINUTE)/ MINUTES_HOUR)/ HOURS_DAY)/ DAYS_YEAR).floor
  end
end
