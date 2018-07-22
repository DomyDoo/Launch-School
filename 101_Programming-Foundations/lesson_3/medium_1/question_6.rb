def add_rutabaga(a_string_param, an_array_param)
  a_string_param += " rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = add_rutabaga(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Making the name of the function describe what the function does is helpful to other programmers
# Also, having a return all the values you want to return from a function 
# makes it easier to figure out what is going on with the code.
# Took out the << method so the array_param argument is not getting mutated.