arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]


even_arr = []

arr.each do |sub_hsh|
  counter = 0
  sub_hsh.each do |key, array|
    array.each do |num|
      counter += 1 if num.odd?
    end
  end
  even_arr << sub_hsh if counter == 0 
end

p even_arr
