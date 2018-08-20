STR_TO_INT = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(str)
  arr = []
  str.each_char { |char| arr << char if STR_TO_INT.key?(char) }

  sum = 0
  arr.reverse.each.with_index do |num, index|
    sum += STR_TO_INT[num] * 10**index
  end
  sum
end

def string_to_signed_integer(str)
  if str[0] == '-'
    string_to_integer(str[1..str.size]) * -1
  else 
    string_to_integer(str)
  end

end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100