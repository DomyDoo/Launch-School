answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8


=begin

The above code will print out 34. Because the p line at the end subtracts 8
from the variable answer which is 42. 
If the code was 'instead p new_answer - 8' the code would print out 42.

=end

p new_answer - 8