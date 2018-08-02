arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

final_hash = {}
arr.map do |sub_arr|
  final_hash[sub_arr[0]] = sub_arr[1]
end

p final_hash