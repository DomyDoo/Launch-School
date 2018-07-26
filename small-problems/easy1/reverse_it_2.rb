def reverse_words(str)
  ans = []
  word_arr = str.split

  word_arr.each do |word|
    if word.size > 4
      ans << word.reverse 
    else
      ans << word
    end
  end

  ans.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS