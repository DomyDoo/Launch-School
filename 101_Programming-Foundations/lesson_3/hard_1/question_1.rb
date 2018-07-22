if false
  greeting = “hello world”
end

p greeting

=begin

Variables defined in the blocks that do not get execited are given the value nil.
So since the if false block will never be executed, the value of greeting is nil.

=end