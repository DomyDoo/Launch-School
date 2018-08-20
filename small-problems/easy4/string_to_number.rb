STR_TO_INT = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

=begin
  
1. convert string to array
2. reverse array
3. loop through array with index
- grab str_to_int value 
- multiply by 10 ^ (index)
- add to sum
4. return sum
  
=end

def string_to_integer(str)
  arr = []
  str.each_char { |char| arr << char if STR_TO_INT.key?(char) }

  sum = 0
  arr.reverse.each.with_index do |num, index|
    sum += STR_TO_INT[num] * 10**index
  end
  sum
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570