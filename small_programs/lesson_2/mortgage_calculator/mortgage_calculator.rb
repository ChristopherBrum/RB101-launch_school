require 'yaml'
require 'pry'

####################  messages and display  ####################

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def write(message, lang='en', extra_input='')
  message = MESSAGES[lang][message]
  if extra_input.length != 0
    puts "~~> #{message} #{extra_input}"
  else
    puts message.start_with?('     ') ? "#{message}" : "~~> #{message}"
  end
end

def messages(message, lang='en')
  MESSAGES[lang][message]
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

def valid_language_choice?(language_input)
  true if %w(1 2).include?(language_input)
end

####################  language  ####################
def check_language
  continue_in_english? ? 'en' : choose_language()
end

def continue_in_english?
  keep_english = nil
  write('english_or_other')
  stay_in_english = gets.chomp
  if valid_yes_no?(stay_in_english) 
    keep_english = yes_or_no(stay_in_english)
    # binding.pry
  else 
    continue_in_english?
  end
  keep_english
end

def choose_language()
  write('choose_language')
  language_input = gets.chomp
  if valid_language_choice?(language_input)
    set_language(language_input)
  else
    write('invalid')
    choose_language
  end
end

def set_language(language_input)
  language = case language_input
             when '1'
              'en'
             when '2'
              'es'
             end
  language
end

####################  loan amount  ####################
def get_loan_amt(lang)
  write('loan_amt_prompt', lang)
  write('loan_amt_format', lang)
  loan_amt = gets.chomp.strip
  validate_loan_amt(loan_amt, lang)
end

def validate_loan_amt(loan_amt, lang)
  amount = loan_amt.split('')
  unacceptable_inputs = false

  amount.each do |el| 
    if /[a-zA-Z\s]/.match(el)
      unacceptable_inputs = true
    end
  end

  if unacceptable_inputs == true
    write('invalid_loan_amt', lang)
    get_loan_amt(lang) 
  end
  confirm_loan_amt(clean_up_loan_amt(loan_amt), lang)
end

def clean_up_loan_amt(loan_amt)
  loan_amt = loan_amt.split('').delete_if { |el| /\D/.match(el) }
  loan_amt.join('').to_i
end

def confirm_loan_amt(loan_amt, lang)
  write('confirm_loan_amt', lang, format_loan_amt(loan_amt))
  confirmation = gets.chomp

  if valid_yes_no?(confirmation) 
    confirmation = yes_or_no(confirmation)
  else
    get_loan_amt(lang)
  end
  loan_amt
end

def format_loan_amt(loan_amt)
  loan_amt = loan_amt.to_s
  count = loan_amt.length - 3

  until count <= 0 do
    loan_amt.insert(count, ',')
    count -= 3
  end

  '$' + loan_amt
end

####################  apr  ####################


####################  program  ####################
reset_screen
display_title
lang = check_language
loop do
  loan_amt = get_loan_amt(lang)
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