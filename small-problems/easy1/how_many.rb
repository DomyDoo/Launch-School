def count_occurrences(arr)
  final_hash = {}
  arr.each do |item|
    if final_hash.include?(item)
      final_hash[item] += 1
    else
      final_hash[item] = 1
    end
  end
  final_hash.each { |k,v| puts "#{k} => #{v}" } 
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
count_occurrences(vehicles)