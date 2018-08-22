require 'pry'

def fib(n)
  if n == 1
    1
  elsif n == 2
    2
  else
    fib(n-1) + fib(n-2)
  end

end

def find_fibonacci_index_by_length(n)

  ans = nil
  counter = 1
  loop do
    num = fib(counter)
    binding.pry
    if num.to_s.size == n
      ans = counter - 1 
      break
    end
    counter += 1 
  end
  ans
end

puts find_fibonacci_index_by_length(2) #== 7
puts find_fibonacci_index_by_length(10) #== 45
puts find_fibonacci_index_by_length(100) #== 476
puts find_fibonacci_index_by_length(1000) #== 4782
puts find_fibonacci_index_by_length(10000) #== 47847