hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)

hsh.each do |item, str_arr|
  str_arr.each do |str|
    str.each_char { |c| puts c if vowels.include?(c) }
  end
end

