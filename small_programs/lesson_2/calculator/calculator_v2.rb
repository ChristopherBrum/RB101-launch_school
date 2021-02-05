require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

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

def greeting(lang)
  system 'clear'
  prompt(messages('greeting', lang))
end

# Language selection and validation
def select_language
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

# Name input and validation
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

# Number and FLoat input and validation
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

def operation_to_message(op)
  output =  case op
              when '1'
                output = messages('adding')
              when '2'
                output = messages('subtracting')
              when '3'
                output = messages('multiplying')
              when '4'
                output = messages('dividing')
            end

  output
end


# Program begines running here:

lang = select_language()
greeting(lang)
get_name(lang)


num1 = nil
loop do
  # num1 input and validation
  loop do
    prompt(messages('get_num1', lang))
    num1 = gets.chomp

    if number?(num1)
      break
    else
      prompt(messages('num_error'))
    end
  end

  # num2 input and validation
  num2 = nil
  loop do
    prompt(messages('get_num2'))
    num2 = gets.chomp

    if number?(num2)
      break
    else
      prompt(messages('num_error'))
    end
  end

  # operator input and validation
  operator = ''
  loop do
    prompt(messages('operator_prompt'))
    operator = gets.chomp

    if valid_operator?(operator)
      break
    else
      prompt(messages('operator_error'))
    end
  end

  result =  case operator
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
            end

  prompt(operation_to_message(operator) + messages('operation_calc_indicator'))
  sleep 1.5
  prompt(messages('return_result'), result.to_s)

  prompt(messages('another_calc'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('farewell'))
