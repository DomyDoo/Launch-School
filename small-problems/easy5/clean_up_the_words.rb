
def cleanup(str)
  str.gsub(/[^A-Za-z]/, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
