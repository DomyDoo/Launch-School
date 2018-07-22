numbers = [1, 2, 2, 3]
numbers.uniq

=begin
 I would expect the following "puts numbers" to print out the
 original numbers array [1, 2, 3, 4]. The uniq method returns
 and array of only unique values from the numbers array, but
 does not mutate the caller.  To return an array of [1, 2, 3],
 the uniq! method would need to be called.
=end

puts numbers

