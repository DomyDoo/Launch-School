a = 2
b = [5, 8]
arr = [a, b]        # arr = [2, [5, 8]]

arr[0] += 2         # arr = [4, [5, 8]]
arr[1][0] -= a      # arr = [4, [1, 8]]


puts "The final values of a and b are 2 and [3, 8] respectively.
The a value is still 2 because line 5 assigns the position in arr to a new value, not mutating the original a value.
The final arr value will be [4, [3, 8]]"

p a
p b
p arr

