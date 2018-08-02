
def return_uuid
  characters = 'abcdefghijklmnopqrstuvwxyz0123456789'.split('')
  template = '00000000-0000-0000-0000-000000000000'.split('')
  template.map! do |value|
    if value == '0'
      value = characters.sample
    else
      value = '-'
    end
  end

  template.join

end

puts return_uuid
puts return_uuid
puts return_uuid
puts return_uuid
