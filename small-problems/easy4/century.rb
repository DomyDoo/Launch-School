# int argument
require 'pry'

def century(num)
  num_sliced = num.to_s[0..-3]
  if num % 100 == 0
    num_sliced + 'th'
  elsif ['11', '12', '13'].include?(num_sliced)
    num_sliced + 'th'
  elsif num_sliced[-1] == '1'
    "#{num_sliced.to_i + 1}th"
  elsif num_sliced[-1] == '2'
    "#{num_sliced.to_i + 1}nd"
  elsif num_sliced[-1] == '3'
    "#{num_sliced.to_i + 1}rd"
  else
    "#{num_sliced.to_i + 1}th"
  end







  # cent = num.to_s[0..-3].to_i + 1
  # cent_str = cent.to_s
  # case cent_str
  #
  # when cent_str[-1] == '1' then cent_str + 'st'
  # when cent_str[-1] == '2' then cent_str + 'nd'
  # when cent_str[-1] == '3' then cent_str + 'rd'
  # else
  #   cent_str + 'th'
  # end
end

puts century(2000) #== '20th'
puts century(2001) #== '21st'
puts century(1965) #== '20th'
puts century(256) #== '3rd'
puts century(5) #== '1st'
puts century(10103) #== '102nd'
puts century(1052) #== '11th'
puts century(1127) #== '12th'
puts century(11201) #== '113th'
