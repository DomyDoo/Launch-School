def sum(num)
  ans = 0

  arr = num.to_s.chars
  arr.each { |i| ans += i.to_i}
  
  ans
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45