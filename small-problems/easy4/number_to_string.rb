
INT_TO_STR = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(num)
  arr = []
  counter = 1
  loop do
    bit = num % 10**counter
    arr << INT_TO_STR[bit / 10**(counter-1)]
    break if bit == num
    counter += 1
  end
  arr.reverse.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
puts integer_to_string(-123) == '-123'