require 'pry'

INT_TO_STR = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(num)
  arr = []
  counter = 1
  loop do
    bit = num % 10**counter
    #binding.pry
    arr << INT_TO_STR[bit / 10**(counter-1)]
    break if bit == num
    counter += 1
  end
  arr.reverse.join
end

def signed_integer_to_string(num)
  if num > 0
    '+' + integer_to_string(num)
  elsif num < 0
    '-' + integer_to_string(-num)
  else
    '0'
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'