require 'yaml'
require 'pry'

####################  messages and display  ####################

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def write(message, extra_input='')
  message = MESSAGES[message]
  if extra_input != ''
    puts "~~> #{message} #{extra_input}"
  else
    puts message.start_with?('     ') ? message : "~~> #{message}"
  end
end

def messages(message)
  MESSAGES[message]
end

def reset_screen
  system("clear")
end

def display_title
  write('title')
end

def recalculate?
  write('recalculate?')
  answer = gets.chomp
  yes_or_no(answer) ? true : false
end

####################  validation  ####################

def yes_or_no(input)
  messages('valid_yes').include?(input) ? true : false
end

def valid_integer?(num)
  true if num.to_i.to_s == num
end

def valid_float?(num)
  true if num.to_f.to_s == num
end

def valid_loan_amt?(loan_amt)
  valid_integer?(loan_amt) && loan_amt.to_i > 0
end

def valid_pos_number?(num)
  if (valid_integer?(num) || valid_float?(num)) && num.to_f > 0
    true
  else
    false
  end
end

def valid_rate?(rate)
  test_rate = rate.to_f.to_s.slice(1, 3)
  rate.slice(0, 3) == test_rate
end

####################  formatting  ####################

def format_loan_amt(loan_amt)
  loan_amt = loan_amt.to_s
  count = loan_amt.length - 3

  until count <= 0
    loan_amt.insert(count, ',')
    count -= 3
  end

  loan_amt
end

def format_interest_rate(interest)
  (interest * 100).to_s + '%'
end

def format_monthly_payment(amount)
  decimal = ''
  amount = amount.round(2).to_s
  if amount.include?('.')
    decimal = amount.slice(amount.index('.'), amount.length - 1)
  end

  amount.slice!(amount.index('.'), amount.length - 1)
  amount = format_loan_amt(amount)
  decimal = check_decimal(decimal)
  amount = '$' + (amount + decimal)
  amount
end

def check_decimal(decimal)
  if decimal.length < 3
    decimal + '0'
  else
    decimal
  end
end

####################  loan amount  ####################

def get_loan_amt
  loan_amt = ''

  loop do
    write('loan_amt_prompt')
    loan_amt = gets.chomp.strip
    break if valid_loan_amt?(loan_amt)
    write('invalid_loan_amt')
  end

  loan_amt.to_i
end

####################  interest rate  ####################

def get_interest_rate
  interest_rate = ''

  loop do
    write('interest_rate_prompt')
    interest_rate = gets.chomp.strip
    break if valid_rate?(interest_rate)
    write('invalid_interest_rate_input')
  end

  interest_rate.to_f.round(2)
end

####################  term of loan  ####################

def get_loan_term
  loan_term = ''
  loop do
    write('loan_term_prompt')
    loan_term = gets.chomp.strip
    break if valid_pos_number?(loan_term)
    write('invalid_loan_term')
  end

  loan_term
end

####################  calculations  ####################

def confirm_figures(amount, rate, term)
  write('confirm_prompt')
  puts
  write('amount', "$#{amount}")
  write('rate', "#{rate}%")
  write('term', "#{term} years / #{term.to_i * 12} months")
  puts
  confirmation = gets.chomp
  yes_or_no(confirmation)
end

def calculate_monthly_payment(int_rate, term, amount)
  annual_interest_rate = int_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  term_in_months = term.to_i * 12

  monthly_payment = amount * (monthly_interest_rate / (1 -
    (1 + monthly_interest_rate)**(-term_in_months)))
  puts
  payment = format_monthly_payment(monthly_payment)
  puts "Your monthly payment would be : #{payment}"
  puts
end

####################  program  ####################

reset_screen
display_title
loop do
  loan_amount_raw = get_loan_amt()
  interest_rate_raw = get_interest_rate()
  term_raw = get_loan_term()
  formatted_loan_amount = format_loan_amt(loan_amount_raw)
  next unless confirm_figures(formatted_loan_amount,
                              interest_rate_raw,
                              term_raw)
  calculate_monthly_payment(interest_rate_raw, term_raw, loan_amount_raw)
  break unless recalculate?
  reset_screen
end
write('farewell')

# user input

# GET loan amount from user
# GET APR from user
# GET the loan duration from user

# calculations

# CALC monthly interest rates
# CALC loan duration in months
# CALC monthly payment

# display monthly payment

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# display welcome

# => USER INPUT
# prompt for loan amount
# store loan amount
# validate input
# allow for $ and ,'s?

# prompt for loan apr
# store loan apr
# validate input
# convert into percentage?

# prompt for loan duration
# store loan duration
# validate input
# convert into months

# => CALCULATIONS
# monthly payments calculation

# => DISPLAY
# display monthly payments
# ask to recalulate
