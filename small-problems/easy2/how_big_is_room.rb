SQMETERS_TO_SQFEET = 10.7639
SQMETERS_TO_SQINCH = 1550
SQMETERS_TO_SQCM = 10000

conversion_hash = { 1 => { factor: SQMETERS_TO_SQFEET, verbage: "square feet" },
                    2 => { factor: SQMETERS_TO_SQINCH, verbage: "square inches" },
                    3 => { factor: SQMETERS_TO_SQCM, verbage: "square centimeters" } }


loop do
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_i

  puts "\nEnter the width of the room in meters:"
  width = gets.chomp.to_i

  conversion_selection = nil
  loop do
    puts "\nWould you like the result in 1) square feet 2) square inches or 3) square centimeters?"
    puts "Please choose the appropriate number."

    conversion_selection = gets.chomp.to_i
    break if [1, 2, 3].include?(conversion_selection)

    puts "That is not a valid answer."  
  end

  sq_m = length * width
  sq_selected = sq_m * conversion_hash[conversion_selection][:factor]
  verbage = conversion_hash[conversion_selection][:verbage]

  puts "\nThe area of the room is #{sq_m.round(2)} square meters (#{sq_selected.round(2)} #{verbage})."

  puts "\nWould you like to perform another conversion? (Enter Y)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
