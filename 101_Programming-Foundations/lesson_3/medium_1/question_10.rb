def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

=begin

The below code will call the foo function into the bar function. The foo function return "yes"
no matter what arguments are passed into it, even though there wasn't an argument in the this 
example. So, the string 'yes' is being passed into bar, which is will maked the param == "no"
comparison false, which will case the function to print out "no".

=end

p bar(foo)
