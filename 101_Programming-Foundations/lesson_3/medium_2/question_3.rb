def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin

my_string will still be "pumpkins" because the concatenated a_string_param is not
returned by the function, nor does it mutate the value being passed in.

my_array will be ["pumpkins", "rutabaga"] because the << mutates the argument passed
into the function.  This value will also be what is returned by the function
because it is the last line of the function.

=end
