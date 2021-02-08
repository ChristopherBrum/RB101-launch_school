require 'yaml'

####################  messages and display  ####################

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def write(message, lang='en')
  message = MESSAGES[lang][message]
  puts message.start_with?('     ') ? "#{message}" : "~~> #{message}"
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def reset_screen
  system("clear")
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

def valid_name?(name)
  p [a-zA-Z].match(name)
end

####################  language  ####################
def check_language
  continue_in_english? ? 'en' : choose_language()
end

def continue_in_english?
  change = nil
  write('english_or_other')
  stay_in_english = gets.chomp
  if valid_yes_no?(stay_in_english) 
    change = yes_or_no(stay_in_english)
  else 
    continue_in_english?
  end
  change
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

####################  user info  ####################
def customer_info(lang)
  customer = {}
  customer[:first_name] = get_first_name(lang)
  customer[:last_name] = get_last_name(lang)
end

def get_first_name(lang)
  write('greeting_and_first_name', lang)
  first_name = gets.chomp
  valid_name?(first_name) ? return : write('invalid_name')
end

def get_last_name(lang)
  write('last_name', lang)
  customer[:last_name] = gets.chomp
end

####################  program  ####################
reset_screen()
loop do
  write('title')
  lang = check_language
  customer = customer_info(lang)
  break
end

# When prompted about cont in english or y and n work fine, 
# but if you enter an incorrect input 1 or more times the y will 
# take you to the language choice selection. 
# Effectively y and n do the same thing at that point.