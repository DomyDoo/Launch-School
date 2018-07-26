def stringy(num)
  ans = ''
  
  num.times do |i|
    if i.even?
      ans << '1'
    else
      ans << '0'
    end
  end

  ans
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'