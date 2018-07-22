# A

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# The above function does not mutate the argument objects passed into it,
# so one, two, and three still have their original object values.

# ------------------------------------------------------------------------------

# B

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# The above function does not mutate the argument objects passed into it,
# so one, two, and three still have their original object values.

# ------------------------------------------------------------------------------

# C

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# The above function uses the gsub! method which does mutate the objects
# called by the function. So the values of one, two, and three do change.
# one = 'two'
# two = 'three'
# three = 'one'