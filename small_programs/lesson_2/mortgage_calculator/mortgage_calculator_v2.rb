require 'yaml'
require 'pry'

####################  messages and display  ####################

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def write(message, extra_input='')
  message = MESSAGES[message]
  if extra_input != ''
    puts "~~> #{message} #{extra_input}"
  else
    puts message.start_with?('     ') ? "#{message}" : "~~> #{message}"
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

####################  validation  ####################

def valid_yes_no?(input)
  return true if messages('valid_yes_no').include?(input) 
  write('invalid')
  false
end

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
  valid_integer?(loan_amt)
end

def valid_pos_number?(num)
  (valid_integer?(num) || valid_float?(num)) && num.to_f > 0
end

####################  formatting  ####################

def format_loan_amt(loan_amt)
  loan_amt = loan_amt.to_s
  count = loan_amt.length - 3

  until count <= 0 do
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
  amount = '$' + (amount + decimal)
  amount
end

####################  loan amount  ####################

def get_loan_amt()
  loan_amt = ''

  loop do
    write('loan_amt_prompt')
    loan_amt = gets.chomp.strip
    break if valid_loan_amt?(loan_amt)
    write('invalid_loan_amt')
  end

  loan_amt.to_i
end

####################  apr  ####################

def get_interest_rate()
  interest_rate = ''

  loop do
    write('interest_rate_prompt')
    interest_rate = gets.chomp.strip
    break if valid_pos_number?(interest_rate)
    write('invalid_interest_rate_input')
  end

  interest_rate = (interest_rate.to_f * 0.01).round(2)
end

####################  term of loan  ####################

def get_loan_term()
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

def calculate_monthly_payment(int_rate, term, amount)
  annual_interest_rate = int_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate  / 12
  term_in_months = term.to_i * 12

  monthly_payment = amount * (monthly_interest_rate / (1 - 
    (1 + monthly_interest_rate)**(-term_in_months)))

  format_monthly_payment(monthly_payment)
end

####################  program  ####################

reset_screen
display_title
loop do
  loan_amount_raw = get_loan_amt()
  interest_rate_raw = get_interest_rate()
  term_raw = get_loan_term()

  formatted_loam_amount = format_loan_amt(loan_amount_raw)
  formatted_interest_rate = format_interest_rate(interest_rate_raw)

  puts calculate_monthly_payment(interest_rate_raw, term_raw, loan_amount_raw)
  break
end

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