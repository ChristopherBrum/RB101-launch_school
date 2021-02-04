# Inputs: 2 integers
#         string or integer input choosing math operator
# Outputs: Display integer results

require 'yaml'
MESSAGES = YAML.load_file("messages.yml")

def prompt(message)
  puts "=> #{message}"
end

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
  true if ['1', '2', '3', '4'].include?(op)
end

def operation_to_message(op)
  output =  case op
              when '1'
                output = 'Adding'
              when '2'
                output = 'Subtracting'
              when '3'
                output = 'Multiplying'
              when '4'
                output = 'Dividing'
            end

  output
end

def greeting()
  prompt(MESSAGES["greeting"])
  name = gets.chomp
  valid_name?(name)
end

def valid_name?(name)
  if name.empty?
    prompt("Make sure to enter a valid name.")
  else
    prompt("Hi #{name}.")
  end
end

greeting

num1 = nil
loop do
  # num1 input and validation
  loop do
    prompt(MESSAGES['get_num1'])
    num1 = gets.chomp

    if number?(num1)
      break
    else
      prompt(MESSAGES["number_error"])
    end
  end

  # num2 input and validation
  num2 = nil
  loop do
    prompt("What's your second number?")
    num2 = gets.chomp

    if number?(num2)
      break
    else
      prompt(MESSAGES["number_error"])
    end
  end

  # operator input and validation
  operator = ''
  loop do
    operator_prompt = <<-MSG
    What operation would you like to perform? 
    1)Add  
    2)Subtract  
    3)Multiply  
    4)Divide
    MSG

    prompt(operator_prompt)
    operator = gets.chomp

    if valid_operator?(operator)
      break
    else
      prompt("Hmm... that doesn't look like a valid input.")
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

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep 1.5
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using Calculator. Byeeeeeeeeee!")
