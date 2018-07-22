=begin
  puts "the value of 40 + 2 is " + (40 + 2)

  The above code results in an error because it is trying to concatenate
  a string with a number, which is not allow.  The result of 40 + 2
  would have to be made into a string using .to_s method or the math operation
  could be interpolated into the string using #{}:
  "the value of 40 + 2 is #{40 + 2}"
  which automatically turns the result 42 into a string.
  
=end

puts "the value of 40 + 2 is #{40+2}."