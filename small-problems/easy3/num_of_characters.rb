print "Please write a word or multiple words: "
str = gets.chomp

char_num = str.delete(' ').size
puts "There are #{char_num} characters in \"#{str}\"."
