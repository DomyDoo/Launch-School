limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# The original code threw an error because the function used a variable 'limit'
# that was not defined in the scope of the function. Making a limit as part
# of the function arguments fixed this problem.