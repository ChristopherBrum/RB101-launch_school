# Write a method that returns the sum of two integers

# Get two numbers from the user
# Calculate the problem
# Display the sum of the two numbers

# START

# GET the user for a number
# SET num1 = the users first number
# GET the user for another number
# SET num2 = the users second number

# SET result =  the sum of num1 and num2

# PRINT the result

# END


puts "Enter a number:"
num1 = gets.chomp
puts "Enter a second number:"
num2 = gets.chomp

result = num1.to_i * num2.to_i

puts num1 + ' times ' + num2 + ' equals ' + result.to_s


#################################
# Write a method that takes an array of strings, 
# and returns a string that is all those strings concatenated together

# Define a method that takes in an array of strings as an argument, 
# and an optional boolean argument of whether or no the array of questions will form a question.
#   Join the array of strings together with a space and assign to a variable.
#   If the method arr is a question it adds a ? to the end
#   Otherwise it adds a . to the end
# Reuturns the variable 

# Declare vaiable and set it equal to an array of strings
# Call the method with arr argument and optional question argument

# START

# DEFINE array_to_phrase method (arr, is_question=false)
#   SET phrase = arr.join(' ')
#   IF is_question == true
#     SET phrase = phrase + '?'
#   ElSE
#     SET phrase = phrase + '.'
  
#   RETURN phrase

# SET arr = ['What\'s', 'all', 'this', 'nonesense', 'then']
# CALL array_to_phrase(arr, true)

# END

def array_to_phrase(array, is_question=false)
  phrase = array.join(' ')
  if is_question == true 
    phrase = phrase + '?'
  else
    phrase = phrase + '.'
  end

  return phrase
end

arr = ['What\'s', 'all', 'this', 'nonesense', 'then']
puts array_to_phrase(arr, true)
puts array_to_phrase(arr)


########################################
# INPUT: an array of integers
# OUTPUT: a new array with every other element of the original array

# Define a method that will take an array as an argument
#   Create an empty array  
#   Iterate over the parameter array 
#     Push every other element from the original to the new array
    
#   return new array

# assign an array to a variable
# call method with array as argument

# START

# DEFINE alter_array(arr) method
#   SET new_arr = nil
#   SET count = 0
  
#   WHILE count < length of arr
#     IF count is odd
#       PUSH arr at index of count to new_arr
#     ELSE
#       next
#   RETURN new_arr

# SET arr = an array of random elements
# CALL alter_array(arr)

# END

def alter_array(arr)
  new_arr = []
  
  arr.each_with_index do |element, index|
    if index.even?
      new_arr.push(element)
    end
  end
  new_arr.to_s
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts alter_array(arr)