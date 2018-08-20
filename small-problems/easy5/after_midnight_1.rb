=begin

1. check if over 24 hours and reduce until <= 24 hours
2. get remaining hours and minutes
3. if negative subtract from 24 hours
4. else add from zero

=end

def time_of_day(mins)
  negative = true if mins < 0

  mins = mins.abs
  while mins / 60 > 24
    mins -= (24 * 60)
  end

  hours = mins / 60
  minutes = mins % 60

  if negative
    hours = 23 - hours
    minutes = 60 - minutes
  end

  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"