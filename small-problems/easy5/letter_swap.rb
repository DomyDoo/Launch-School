def swap(str)
  arr = str.split(' ')
  arr.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  arr.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'