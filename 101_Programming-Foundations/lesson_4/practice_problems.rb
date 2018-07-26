# Problem 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
final_hash = {}
flintstones.each_with_index do |name, index|
  final_hash[name] = index
end

p final_hash

# Problem 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_ages = 0
ages.each { |name, age| sum_ages += age }

puts sum_ages

# Problem 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age > 100 }
p ages

# Problem 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min

# Problem 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

ans = nil
flintstones.each_with_index do |name, index|
  ans = index if name.start_with?("Be")
end
puts ans

# Problem 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0,3]
end

p flintstones

# Problem 7

statement = "The Flintstones Rock"

letter_counter = {}

statement.delete(' ').each_char do |letter|
  if letter_counter.include?(letter)
    letter_counter[letter] += 1
  else
    letter_counter[letter] = 1
  end
end

p letter_counter

# Problem 8

numbers = [1, 2, 3, 4]
ans1 = numbers.each do |number|
         p number
         numbers.shift(1)
       end

puts "The above code in source returns #{ans1} becuase the block shifts the first two elements of the array off the array 
during the first two iterations, but the iteration number changes with the changing of the array length.  Therefore, the block only 
passes through the array twice and stops after two iterations. Leaving the block to return the original object, the block 
finally returns the mutated block [3, 4] with the 1 and 2 elements shifted off."

numbers = [1, 2, 3, 4]
ans2 = numbers.each do |number|
         p number
         numbers.pop(1)
       end

puts "The above code in source returns #{ans2} because the length of the array changes as the last elements are popped off.
The block only runs twice and returns the original object which has been mutated to [1, 2]."

# Problem 9

def titleize(string)
  final = []
  str = string.split
  str.each { |word| final << word.capitalize }

  final.join(' ')
end

puts titleize("the flintstones rock")
puts titleize("bob and ted's excellent adventure")

# Problem 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, inner_hash|
  case inner_hash['age']
  when 65..Float::INFINITY
    inner_hash['age_group'] = 'senior'
  when 18..64
    inner_hash['age_group'] = 'adult'
  when 0..17
    inner_hash['age_group'] = "kid"
  end  
end

puts munsters 