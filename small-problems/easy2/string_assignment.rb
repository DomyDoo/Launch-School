puts "The below code will print out:\nBOB\nBOB"
puts "This is because save_name and name are pointing to the same object and
when name.upcase! is called, this operation is mutating the object that both
save_name and name are pointing to."

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
