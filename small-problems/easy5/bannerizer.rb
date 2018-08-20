
def print_in_box(str)
  puts "+-#{'-' * str.size}-+"
  puts "+ #{' ' * str.size} +"
  puts "+ #{str} +"
  puts "+ #{' ' * str.size} +"
  puts "+-#{'-' * str.size}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('Domenic is so cool and can print shit in a box and make it fit appropriately')
print_in_box('')