# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt_yml(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i().to_s == number || number.to_f().to_s == number
end

def operation_to_message(op)
  op_string =   case op
                when '1'
                  'Adding'
                when '2'
                  'Subtracting'
                when '3'
                  'Multiplying'
                when '4'
                  'Dividing'
                end
  op_string
end

prompt_yml('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt_yml('valid_name')
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  number1 = nil
  loop do
    prompt_yml('number1_prompt')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt_yml('valid_integer')
    end
  end

  number2 = nil
  loop do
    prompt_yml('number2_prompt')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt_yml('valid_integer')
    end
  end

  prompt_yml('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt_yml('valid_operator')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_f() + number2.to_i()
           when '2'
             number1.to_f() - number2.to_i()
           when '3'
             number1.to_f() * number2.to_i()
           else
             number1.to_f() / number2.to_f()
           end

  result = result.to_i() if result % 1 == 0

  prompt("The result is #{result}")

  prompt_yml('another_calc')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt_yml('goodbye')
