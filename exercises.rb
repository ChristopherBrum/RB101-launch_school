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

=begin
Understannding the Problem:
  -Input:
  -Output:

  -Rules:

Test Cases:

Data Structures:

Algorithm:

=end



###############

=begin
Write a method that takes a floating point number that represents an angle 
between 0 and 360 degrees and returns a String that represents that angle 
in degrees, minutes and seconds. You should use a degree symbol (°) to 
represent degrees, a single quote (') to represent minutes, and a double 
quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should 
be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and 
seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol: DEGREE = "\xC2\xB0"

Understannding the Problem:
  -Input: Float, representing an angle between 0 and 360 degrees
  -Output: String, representing that angle in degrees, minutes and seconds

  -Rules:
    -Use the degree symbol to represent degrees (˚)
    -Use single quote to represent minutes (')
    -Use double-quote to represent seconds (")
    -A degree has 60 minutes (any remainder of degree == 60 * (remainder / 100))
    -A minute has 60 seconds (any remainder of minute == 60 * (remainder / 100))
    -Use two-digit numbers when formatting minutes and seconds, 
      leading with a zero if the min/sec are single digit


Test Cases:
  dms(30) == %(30°00'00")
  dms(76.73) == %(76°43'48")
  dms(254.6) == %(254°36'00")
  dms(93.034773) == %(93°02'05")
  dms(0) == %(0°00'00")
  dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Data Structures:
  -floats, strings

Algorithm:
  -'input_num' is the integer parameter passed in
  -set 'degree' 
    -the value of 'input_num' converted to integer
  -set 'minutes'
    -subtract 'degree' from the value of 'input_num' and round to the hundreth
    -multiply previous value with 60
    -set 'minutes' to the updated value of 'input_num' converted to integer
  -set 'seconds' 
    -subtract 'minutes' from the value of 'input_num' and round to the hundreth
    -multiply previous value with 60
    -set 'seconds' to the updated value of 'input_num' converted to integer
  -if degree/minutes/seconds are single digit fill in first character with '0'
  -return concatenated string of 'degree˚minutes'seconds"'

=end

def dms(num)
  degree = num.to_i
  p num, degree
  # minutes = add_zero(minutes.to_i)
  # seconds = add_zero(seconds)
  #puts "#{degree}˚#{minutes}'#{seconds}\""
end

# def add_zero(integer)
#   p integer.to_s
#   if integer.to_s.length == 1
#     integer = '0' + integer.to_s 
#   elsif integer.to_s.length < 1
#     integer = '00'
#   end
# end

# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
#dms(0) == %(0°00'00")
#dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

###############

=begin
Understannding the Problem:
  -Input:
  -Output:

  -Rules:

Test Cases:

Data Structures:

Algorithm:

=end



###############

=begin
Understannding the Problem:
  -Input:
  -Output:

  -Rules:

Test Cases:

Data Structures:

Algorithm:

=end