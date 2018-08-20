puts "the following code will print out:"
puts "[Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]"
puts "This is because line 3 assigns the same objects in array1 to array2
by copying each array1 reference value to it. Then line 4 mutates those array item objects
which array2 also points to."

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
