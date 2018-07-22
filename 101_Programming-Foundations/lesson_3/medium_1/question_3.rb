=begin
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
=end

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end


p factors(7)
p factors(8)
p factors(40)
p factors(0)

# Bonus 1
# The number % dividend == 0 uses the modulus operator to determine if the dividend is a divisor.
# Which is a number that divides into another number without a remainder.

# Bonus 2
# The divisors just before the end is there so the divisors array is what is returned by the function.

