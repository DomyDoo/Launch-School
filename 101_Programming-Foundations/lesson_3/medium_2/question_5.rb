#def color_valid(color)
#  if color == "blue" || color == "green"
#    true
#  else
#    false
#  end
#nd

def color_valid(color)
  color == 'blue' || color == 'green'
end

p color_valid('blue')     # => true
p color_valid('green')    # => true
p color_valid('purple')   # => false
p color_valid('orange')   # => false