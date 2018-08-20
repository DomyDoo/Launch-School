def short_long_short(str1, str2)
  arr = [str1, str2].sort_by { |str| str.size }
  arr << arr[0]
  arr.join('')
end


puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
