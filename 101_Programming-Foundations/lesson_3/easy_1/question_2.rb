=begin
! and ? are seem in multiple places in the ruby languge. One place is at the
end of method names such as uniq! or include? and these are just part of the name.
An ! at the end of the method name often signifies that the method will mutate
the caller.  

1. != means does Not equal and you would use it to show that one thing does not equal another
2. ! before something turns the object into the opposite boolean value (true to false or false to true)
3. ! after something usually signifies a method mutates the caller or just might be part of the method name.
4. ? before something might be setting up a ternary operator.
5. ? after an object might be setting up a ternary operator or just be part of the method name.
6. !! before something is like saying 'not not'. And if something is not not something it is the same as it's original form. So !!true is true because it first changes its boolean value to false then says it's not false. !!false will be false.
=end

puts '1' != 1 #=> true
puts !true # => false
p [1, 2, 2, 5, 6, 7, 7, 5, 10].uniq! # => [1, 2, 5, 6, 7, 10]
puts 33.even? ? "This statement is true" : "This statement is false" # => 'This statement is false'
puts 33.odd? # => true
puts !!true # => true                         
                                 
                                 
