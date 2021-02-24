# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# IDX_NUM = %w(1st 2nd 3rd 4th 5th)
# num_arr =[]

# IDX_NUM.each_with_index do |num, ind|
#   puts "==> Enter the #{num} number:"
#   num_arr[ind] = gets.chomp.to_i
# end

# puts "==> Enter the last number:"
# last_num = gets.chomp.to_i

# if num_arr.include?(last_num)
#   puts "The number 17 appears in #{num_arr.to_s}."
# else
#   puts "The number 17 does not appears in #{num_arr.to_s}."
# end


################
# Write a program that prompts the user for two positive integers, 
# and then prints the results of the following operations on those two 
# numbers: addition, subtraction, product, quotient, remainder, and power. 
# Do not worry about validating the input.

# def prompt(message)
#   puts "==> #{message}"
# end

# def get_number(which_num)
#   prompt("Enter the #{which_num} number:")
#   num = gets.chomp
#   if is_positive?(num)
#     num
#   else
#     prompt('Invalid input. Try again.')
#     get_number(which_num)
#   end
# end

# def is_positive?(num)
#   !/\D/.match?(num) && num.to_i > 0
# end

# def calculate(num1, num2)
#   operators = %w(+ - * / % **)
#   operators.length.times do |index|
#     puts "#{num1} #{operators[index]} #{num2} = \
#     #{eval(num1 + operators[index] + num2)}"
#   end
# end

# num1 = get_number("first")
# num2 = get_number("second")

# calculate(num1, num2)

##################
# def multiply(num1, num2)
#   num1 * num2
# end

# def square(num)
#   multiply(num, num)
# end

# p square(5)


################
# def xor?(bool1, bool2)
#   true if((bool1 && !bool2) || (!bool1 && bool2))
#  end
 
#  p xor?(5.even?, 4.even?) == true
#  p xor?(5.odd?, 4.odd?) == true
#  p xor?(5.odd?, 4.even?) == false
#  p xor?(5.even?, 4.odd?) == false


##############
# def oddities(arr)
#   new_arr = []
#   arr.select do |element| 
#     new_arr << element if arr.index(element).even?
#   end
# end

# def evenities(arr)
#   new_arr = []
#   arr.select do |element| 
#     new_arr << element if arr.index(element).odd?
#   end
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([2, 3, 4, 5, 6])
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities([1, 2, 3, 4, 5, 6])
# p oddities(['abc', 'def']) == ['abc']
# p oddities(['abc', 'def'])
# p oddities([123]) == [123]
# p oddities([123])
# p oddities([]) == []
# p oddities([])
# p evenities([2, 3, 4, 5, 6]) == [3, 5]
# p evenities([2, 3, 4, 5, 6])
# p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
# p evenities([1, 2, 3, 4, 5, 6])
# p evenities(['abc', 'def']) == ['def']
# p evenities(['abc', 'def'])
# p evenities([123]) == []
# p evenities([123])
# p evenities([]) == []
# p evenities([])


############
# def palindrome?(string)
#   string == string.reverse
# end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true
# p palindrome?(%w(a b c d c b a)) == true
# p palindrome?(%w(a b c d c a)) == false


############
# def real_palindrome?(str)
#   str = str.downcase.gsub(/[^0-9a-z]/i, '')
#   str == str.reverse
# end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false


###############
# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Questions I have:
#   -What do we do with spaces?
#   -Whats a substring?
#   -Whats a palendrome?
#   -Will inputs always be strings?

# INPUT: string
# OUTPUT: array of substrings

#   Expliciit rules;
#     -return only substrings that are palendromes.
#     -palendromes are case sensetive.

#   Implicit rules;
#     -