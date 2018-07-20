def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_integer?(number)
  number.empty?() || number.to_i() < 0
end

def valid_float?(number)
  number.empty?() || number.to_f() < 0
end

prompt("Welcome to your Mortgage / Car Loan Calculator")

loop do
  loan_amount = ''
  loop do
    prompt('Enter the loan amount in USD (exclude the dollar sign $)')
    loan_amount = Kernel.gets().chomp()
    break unless valid_float?(loan_amount)
    prompt("That is not a valid loan amount value!")
  end

  apr = ''
  loop do
    prompt('Enter the Annual Percentage Rate (APR). Example: for 3.29% enter 3.29')
    apr = Kernel.gets().chomp()
    break unless valid_float?(apr)
    prompt("That is not a valid APR value!")
  end

  loan_duration = ''
  loop do
    prompt('Enter the loan duration in years.')
    loan_duration = Kernel.gets().chomp()
    break unless valid_integer?(loan_duration)
    prompt("That is not a valid loan duration value!")
  end

  loan_amount = loan_amount.to_i()
  apr = apr.to_f() / 100
  loan_duration = loan_duration.to_i()

  monthly_interest_rate = apr / 12
  loan_duration_months = loan_duration * 12

  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_duration_months))

  prompt("For a #{loan_duration} year $#{format('%.2f', loan_amount)} loan with an APR of #{apr * 100}%...")
  prompt("The monthly payments are $#{format('%0.2f', monthly_payment)}")

  prompt("Would you like to perform another loan calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for using our loan calculator! Goodbye!\n')
