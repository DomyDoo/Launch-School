def select_letter(str, letter)
  ans = ''
  counter = 0

  loop do
    break if counter == str.size


    if str[counter] == letter
      ans << str[counter]
    end
    counter += 1
  end

  ans
end

question = 'How many times does a particular character appear in this sentence?'
puts select_letter(question, 'a') # => "aaaaaaaa"
puts select_letter(question, 't') # => "ttttt"
puts select_letter(question, 'z') # => ""

