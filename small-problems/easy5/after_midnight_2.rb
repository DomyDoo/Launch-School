MINS_IN_DAY = 60 * 24

def retrieve_h_and_min(str)
  hours = str[0..1].to_i
  minutes = str[-2..-1].to_i
  return hours, minutes
end

def after_midnight(str)
  hours, minutes = retrieve_h_and_min(str)

  total_hours = (hours * 60) + minutes
  if total_hours == MINS_IN_DAY
    return 0
  else
    total_hours
  end
end

def before_midnight(str)
  hours, minutes = retrieve_h_and_min(str)

  total_hours = MINS_IN_DAY - (hours * 60) - minutes
  if total_hours == MINS_IN_DAY
    return 0
  else
    total_hours
  end
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0