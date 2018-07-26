def sum(n)
  sum = 0

  n.times do |i|
    sum += i + 1
  end

  return sum, 'sum'
end

def product(n)
  prod = 1

  n.times do |i|
    prod *= i + 1
  end

  return prod, 'product'
end

puts "Please enter an integer greater than 0:"
integer = gets.to_i

puts "Enter 's' to compute the sum, 'p' tp computer the product."
operation = gets.chomp


if operation == 's'
  ans, verbage = sum(integer)
elsif operation == 'p'
  ans, verbage = product(integer)
else
  puts "INPUT ERROR"
end

puts "The #{verbage} of the integers between 1 and #{integer} is #{ans}."


