=begin
The delete_at method deletes the array item at the location of the index passed into the method.
The delete method will delete all occurrences of the argument passed into the method.
=end

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
p numbers

numbers = [1, 2, 3, 4, 5]

numbers.delete(1)
p numbers
