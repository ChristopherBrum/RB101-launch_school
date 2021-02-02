# Inputs: 2 integers
#         string or integer input choosing math operator
# Outputs: Display integer results

# Mental Model: Have user input 2 integers and a mathmatecal operator 
# to be applied to the integers, perform the operation on the numbers, then display the results. 

# Test cases: 
#   Input: 3, 4, 'add'
#   Output: 7


#   Input: 10, 9, 'subtract'
#   Output: 1


#   Input: 19, 17, 'multiply'
#   Output: 323


#   Input: 55, 5, 'divide'
#   Output: 11


#   Input: -13, 4, 'add'
#   Output: 7


#   Input: 5, 5, 'multiply'
#   Output: -25

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def valid_operator?(op)
  true if ['1', '2', '3', '4'].include?(op)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter you name:")
name = ''

loop do 
  name = gets.chomp

  if name.empty?
    prompt("Make sure to enter a valid name.")
  else 
    prompt("Hi #{name}.")
    break
  end
end

num1 = nil
loop do
  # num1 input and validation
  loop do
    prompt("What's your first number?")
    num1 = gets.chomp.to_i

    if valid_number?(num1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end
  
  # num2 input and validation
  num2 = nil
  loop do
    prompt("What's your second number?")
    num2 = gets.chomp.to_i

    if valid_number?(num2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
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
    4)Divide"
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

  prompt("Do you want to perform another calculation #{name}? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using Calculator. Good bye!")