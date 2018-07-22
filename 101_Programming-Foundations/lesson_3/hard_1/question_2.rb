greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

=begin

Since greeting[:a] and informal greetings point to the same object and ' there' was added
to that object, the greetings hash will now be { a: 'hi there' }

=end