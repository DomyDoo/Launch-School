def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin

my_string will be "pumpkinsrutabaga" after the function call because the << method mutates
the string and adds the 'rutabage' string to the end of the object passed in.

my_array will be ["pumpkins"] because the = is just reassignment and does not mutate the 
original array object passed in as an argument.

=end
