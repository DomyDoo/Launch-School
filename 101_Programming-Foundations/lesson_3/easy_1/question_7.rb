def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# eval(how_deep) will actually run the code as a recursive call
# So the eval will add up (8 + (8 + (8 + (8 + (8 + 2))))) =  42
p eval(how_deep)