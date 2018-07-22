def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4    # checks for correct IP address length

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word.to_i)    # returns false if the value is not a valid IP number
  end
  return true
end


def is_an_ip_number?(num)
  (0..255).include?(num)
end

p dot_separated_ip_address?('10.124.73.213')      # true
p dot_separated_ip_address?('10.124.73.256')      # false
p dot_separated_ip_address?('1.1.1')              # false
p dot_separated_ip_address?('1000.124.73.213')    # false
p dot_separated_ip_address?('10.54.193.233.0')    # false