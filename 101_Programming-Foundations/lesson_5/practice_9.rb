arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |subarr|
               subarr.sort do |a, b|
                 b <=> a
               end
             end

p sorted_arr