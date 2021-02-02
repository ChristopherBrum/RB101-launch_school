# Inputs: 2 integers
#         string or integer input choosing math operator
# Outputs: Display integer results

# Mental Model: Have user input 2 integers and a mathmatecal operator 
# to be applied to the integers, then display the results. 

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

loop do 
  puts "Gimme a number, please:"
  num1 = gets.chomp.to_i
  puts "Gimme another number, please:"
  num2 = gets.chomp.to_i
  puts "Choose a math operation (enter 1 through 4):"
  puts "1. Add"
  puts "2. Subtract"
  puts "3. Multiply"
  puts "4. Divide"
  operator = gets.chomp.to_i

  # if !num1.is_a?(Integer) || !num2.is_a?(Integer) || !operator.is_a?(Integer)  
  #   puts "Make sure you're entering numbers only."
  # end 
  
  case operator 
  when 1
    puts "#{num1} added to #{num2} equals #{num1 + num2}!"
    break
  when 2
    puts "#{num1} subtracted by #{num2} equals #{num1 - num2}!"
    break
  when 3
    puts "#{num1} times #{num2} equals #{num1 * num2}!"
    break
  when 4
    puts "#{num1} divided by #{num2} equals #{num1 / num2} rounded down!"
    break
  else
    puts "Lets try this again..."
  end
end