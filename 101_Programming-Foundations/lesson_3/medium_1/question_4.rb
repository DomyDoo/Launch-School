=begin
  
Yes.  
The difference between the two implementations is that in the first one utilizing the <<
method, the new_element is being directly added onto the buffer array passed into the 
function.  And since << is mutating the array, the first function is mutating the original 
buffer array. The second function assigns the input array to a new variable before using
it to concatenate a new element onto it, so it does not mutate the original array.

=end 