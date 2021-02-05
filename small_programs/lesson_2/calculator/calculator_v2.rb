require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, additional_input='')
  if key == MESSAGES['en']['greeting']
    puts key
  elsif additional_input.length != 0
    puts "=> #{key} #{additional_input}"
  else
    puts "=> #{key}"
  end
end

def reset_console
  system 'clear'
end

# ~~~~~~~~~~~~~~~~~~ Language selection and validation ~~~~~~~~~~~~~~~~~~
def select_language
  system 'clear'
  prompt(messages('choose_lang'))
  lang_choice = gets.chomp
  if valid_lang_choice?(lang_choice)
    set_lang(lang_choice)
  else
    prompt(messages('lang_error'))
    select_language
  end
end

def valid_lang_choice?(lang_choice)
  %w(1 2).include?(lang_choice)
end

def set_lang(lang_selection)
  case lang_selection
  when '1'
    language = 'en'
  when '2'
    language = 'es'
  end
  language
end

# ~~~~~~~~~~~~~~~~~~ Name input and validation ~~~~~~~~~~~~~~~~~~
def get_name(lang)
  prompt(messages('get_name', lang))
  name = gets.chomp
  valid_name?(name, lang)
end

def valid_name?(name, lang)
  if name.empty?
    prompt(messages('name_error', lang))
  else
    prompt(messages('hi', lang), name)
  end
end

# ~~~~~~~~~~~~~~~~~~ Number and Float input and validation ~~~~~~~~~~~~~~~~~~
def valid_number?(num)
  true unless /\D/.match(num)
end

def valid_float?(num)
  num.to_f.to_s == num
end

def number?(num)
  valid_number?(num) || valid_float?(num)
end

def valid_operator?(op)
  true if %w(1 2 3 4).include?(op)
end

def get_num(message, lang)
  num = ''
  loop do
    prompt(messages(message, lang))
    num = gets.chomp

    if number?(num)
      break
    else
      prompt(messages('num_error', lang))
    end
  end
  num
end

def get_operator(lang)
  operator = ''
  loop do
    prompt(messages('operator_prompt', lang))
    operator = gets.chomp

    if valid_operator?(operator)
      break
    else
      prompt(messages('operator_error', lang))
    end
  end
  operator
end

def calculate(operator, num1, num2)
  result = nil
  case operator
  when '1'
    result = num1.to_i + num2.to_i
  when '2'
    result = num1.to_i - num2.to_i
  when '3'
    result = num1.to_i * num2.to_i
  when '4'
    result = num1.to_f / num2.to_f
  end
  result
end

# ~~~~~~~~~~~~~~~~~~ Results & Display Messaging ~~~~~~~~~~~~~~~~~~
def greeting(lang)
  reset_console
  prompt(messages('greeting', lang))
end

def operation_to_message(op, lang)
  output =  case op
            when '1'
              messages('adding', lang)
            when '2'
              messages('subtracting', lang)
            when '3'
              messages('multiplying', lang)
            when '4'
              messages('dividing', lang)
            end
  output
end

def processing_data(operator, lang)
  prompt(operation_to_message(operator, lang) + messages('calc_phrase', lang))
  calc_arrow
end

def calc_arrow
  10.times do
    sleep 0.1
    print '='
    sleep 0.1
    print '-'
  end
  puts '>'
end

def show_result(result, lang)
  prompt(messages('return_result', lang), result.to_s)
end

def calc_again(lang)
  prompt(messages('another_calc', lang))
  answer = gets.chomp
  answer
end

def valid_calc_again?(answer)
  true if %w(Y y yes Yes YES si SI Si s).include?(answer)
end

def farewell(lang)
  prompt(messages('farewell', lang))
end

# ~~~~~~~~~~~~~~~~~~ Program begins ~~~~~~~~~~~~~~~~~~

lang = select_language()
greeting(lang)
get_name(lang)

loop do
  num1 = get_num('get_num1', lang)
  num2 = get_num('get_num2', lang)
  operator = get_operator(lang)
  result = calculate(operator, num1, num2)

  processing_data(operator, lang)
  show_result(result, lang)

  answer = calc_again(lang)
  break unless valid_calc_again?(answer)
end

farewell(lang)
