=begin

1. loop through string
2. if current letter == previous letter do not add to ans
3. else add to answer
4. if first letter, add  

=end

def crunch(str)
  ans = ''
  str.each_char do |char|
    if char == ans[-1]
      next
    else 
      ans << char
    end
  end
  ans
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''