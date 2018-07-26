print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retire_age = gets.to_i

current_year = Time.new.year

years_till_retire = retire_age - age

retire_year = current_year + years_till_retire

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{years_till_retire} years of work to go!"