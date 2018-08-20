
verbage = %w(1st 2nd 3rd 4th 5th last)

input_nums = []

def prompt(mess)
  puts "==> #{mess}:"
end

verbage.each do |num|
  prompt "Enter the #{num} number"
  input_num = gets.chomp.to_i
  input_nums << input_num
end

last_num = input_nums.pop

if input_nums.include?(last_num)
  puts "The number #{last_num} appears in #{input_nums}."
else
  puts "The number #{last_num} does not appear in #{input_nums}."
end
