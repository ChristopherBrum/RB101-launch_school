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


# NEED TO RE-WORK THIS PROBLEM


###############

# Write a method that takes an array of strings, and returns an array of the 
# same string values, except with the vowels (a, e, i, o, u) removed.

=begin
Understannding the Problem:
  -Input: Array of strings
  -Output: Array of strings with the vowels removed

  -Rules:
    -Method will take an array strings as an argument
    -The method will remove the vowels from the strings within the array
    -Return the array of strings without vowels 
    -Case insensetive
    -If a string contains all vowels it will return an empty string

Test Cases:
  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
  remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Data Structures:
  -Arrays

Algorithm:
  -Iterate through the array of strings
    -substitute any vowel characters for an empty string
  -return updated array

=end

def remove_vowels(arr)
  arr.map { |str| str.gsub(/[aeiou]/i, '') }
end

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


###############

=begin

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such 
that the first 2 numbers are 1 by definition, and each subsequent number is the 
sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow 
at an incredibly rapid rate. For example, the 100th Fibonacci number is 
354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 
6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number 
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Understannding the Problem:
  -Input: integer
  -Output: integer

  -Rules:
    -Method will take in an integer as an argument
    -The input integer is the desired length of the digits output by the fibonacci sequence
      -ex: input_integer = 2    =>   1 1 2 3 5 8 13    
      -the first integer with the length of 2 digits is 13 which is the 7th digit in the fibonacci sequence
    -return the index of the first instance of a number that matches the length of the input_integer

Test Cases:
  find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
  find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
  find_fibonacci_index_by_length(10) == 45
  find_fibonacci_index_by_length(100) == 476
  find_fibonacci_index_by_length(1000) == 4782
  find_fibonacci_index_by_length(10000) == 47847

Data Structures:
  -Array, integers, strings

Algorithm:
  -array = []
  -set 'base' to 1
  -set 'current_sum' to 0
  -set 'updated_sum' to 0
  -loop while 'sum' to_s is less than 'input_int' 
    -if base == 0 += current_sum
    -current_sum
    -updated_sum


=end

def find_fibonacci_index_by_length(output_length)
  fibonacci_arr = []
  first_num = 0
  second_num = 1

  loop do
    first_num, second_num = second_num, first_num + second_num
    fibonacci_arr << first_num
    if output_length  == second_num.to_s.length 
      fibonacci_arr << second_num
      break
    end
  end
  fibonacci_arr.length
end

# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

###############

=begin

Write a method that takes an Array as an argument, and reverses its elements in place; 
that is, mutate the Array passed into this method. The return value should be the 
same Array object.

You may not use Array#reverse or Array#reverse!.

Note: for the test case list = ['abc'], we want to reverse the elements in the array. 
The array only has one element, a String, but we're not reversing the String itself, 
so the reverse! method call should return ['abc'].

Understannding the Problem:
  -Input: Array
  -Output: Same array object with elements reversed

  -Rules:
    -Takes in an array of elements
    -Reverse elements in place, meaning keeping the same array object reverse the elements within it. 
    -Return value should be the same array object at the input
    -Do not use #reverse or #reverse!
    -We're reversing the elements within the array, not the elements themselves

Test Cases:
  list = [1,2,3,4]
  result = reverse!(list)
  result == [4, 3, 2, 1] # true
  list == [4, 3, 2, 1] # true
  list.object_id == result.object_id # true

  list = %w(a b e d c)
  reverse!(list) == ["c", "d", "e", "b", "a"] # true
  list == ["c", "d", "e", "b", "a"] # true

  list = ['abc']
  reverse!(list) == ["abc"] # true
  list == ["abc"] # true

  list = []
  reverse!(list) == [] # true
  list == [] # true

Data Structures:
  -arrays

Algorithm:
  -iterate through array starting from second to last element working forwards
    -delete second to last element
      -using the deleted elements return value, push to end of array
    -continue to the first element
  -return original array

=end

def reverse!(arr)
  (2..(arr.length)).each do |index|
    arr.push(arr.delete(arr[-index]))
  end
  arr
end

# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

###############

=begin

Write a method that takes an Array, and returns a new Array with the elements of 
the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you 
wrote in the previous exercise.

Understannding the Problem:
  -Input: Array
  -Output: New array with elements of orignal array reversed

  -Rules:
    -Method takes in an array as an argument
    -creates new array
    -populates new array with elements of original array reversed
    -does not mutate the original array
    -Do not use #reverese or #reverse! methods

Test Cases:
  reverse([1,2,3,4]) == [4,3,2,1]          # => true
  reverse(%w(a b e d c)) == %w(c d e b a)  # => true
  reverse(['abc']) == ['abc']              # => true
  reverse([]) == []                        # => true

  list = [1, 3, 2]                      # => [1, 3, 2]
  new_list = reverse(list)              # => [2, 3, 1]
  list.object_id != new_list.object_id  # => true
  list == [1, 3, 2]                     # => true
  new_list == [2, 3, 1]                 # => true

Data Structures:
  -Arrays

Algorithm:
  -Takes in an array as a parameter
  -initialize an empty array to 'new_arr'
  -iterate through input array
    -starting at the end of the original array push the element to the 'new_arr'
  -return 'new_arr'

=end

def reverse(arr)
  reversed_arr = []
  (1..(arr.length)).each do |index|
    reversed_arr.push(arr[-index])
  end
  reversed_arr
end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true


###############

=begin

Write a method that takes two Arrays as arguments, and returns an Array that 
contains all of the values from the argument Arrays. There should be no duplication 
of values in the returned Array, even if there are duplicates in the original Arrays.

Understanding the Problem:
  -Input: 2 arrays
  -Output: 1 array that contains all elements of the 2 input arrays

  -Rules:
    -2 input arrays
    -Create a new array and populate it with the elements of the 2 input arrays
    -There should be no duplicate elements in the new array
    -return new array

Test Cases:
  merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Data Structures:
  -Arrays

Algorithm:
  -set 'combined_arr' to the input arrays concatenated together
  -find all unique values in 'combine_arr'
  -return 'combined_arr'
  
=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq

  # OR

  arr1 | arr2
end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

###############

=begin

Write a method that takes an Array as an argument, and returns two 
Arrays (as a pair of nested Arrays) that contain the first half and 
second half of the original Array, respectively. If the original array 
contains an odd number of elements, the middle element should be placed 
in the first half Array.

Understannding the Problem:
  -Input: Array
  -Output: Array with 2 Arrays nested inside

  -Rules:
    -Method takes an array as an argument
    -Will return a single array with 2 arrays nested within
      -The first nested array contains the first half of elements from the input array
      -The second nested array contains the second half of elements from the input array
      -If input array contains an odd number of elements 
        -The middle element should be placed in the first nested array
Test Cases:
  halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
  halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
  halvsies([5]) == [[5], []]
  halvsies([]) == [[], []]

Data Structures:
  -Arrays

Algorithm:
  -Set 'first_arr' and 'second_arr' both to []
  -Divide length of input array in half and set divided length to 'half_length'
  -Iterate through input array
    -If length of input arr is odd
      -Push elements from input array to first array a number of times equal to 'half length' plus one
    -Otherwise 
      -Push elements from input array to first array a number of times equal to 'half length'
    -Push the remainding elements from input arr to second_arr
  -Push first array and second array to a parent and return

=end

def halvsies(input_arr)
  if input_arr.length.odd?
    idx = (input_arr.length / 2)
  else
    idx = (input_arr.length / 2) - 1
  end
  input_arr.partition { |element| input_arr.index(element) <= idx }
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

###############

=begin

Given an unordered array and the information that exactly one value in 
the array occurs twice (every other value occurs exactly once), how would 
you determine which value occurs twice? Write a method that will find and 
return the duplicate value that is known to be in the array.

Understannding the Problem:
  -Input: Array
  -Output: integer, or other object depending on the warray elements
  
  -Rules:
    -Method takes in an array as an argument
    -The inout array consists of an assortment of elements
    -The array elements are all unique with the exception of one element.
    -Find the element that has a duplicate and return it

Test Cases:
  find_dup([1, 5, 3, 1]) == 1
  find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
            14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
            89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
            41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

Data Structures:
  -Arrays, hash

Algorithm:
  -Tally the input array
  -Find the element thats value is greater than 1
  -Return the key

=end

def find_dup(arr)
  (arr.tally.keep_if { |key, value| value > 1 }).keys[0]
end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          # 78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          # 89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          # 41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          # 55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          # 85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          # 40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          # 7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

###############

=begin

Write a method named include? that takes an Array and a search value as 
arguments. This method should return true if the search value is in the array, 
false if it is not. You may not use the Array#include? method in your solution.

Understannding the Problem:
  -Input: Array and a search value
  -Output: Boolean

  -Rules:
    -Method takes in an array and a value to be searched for within the array
    -If the method finds the search value in the input array
      -return true
    -Otherwise
      -return false

  -Questions:
    -What is a search value?
      -It appears any valid values that an array can contain

Test Cases:
  include?([1,2,3,4,5], 3) == true
  include?([1,2,3,4,5], 6) == false
  include?([], 3) == false
  include?([nil], nil) == true
  include?([], nil) == false

Data Structures:
  -Array

Algorithm:
  -Iterate through the input array
    -compare equality between each element and the search value
    -If the search value is found in the array
      -Return true
    -Otherwise
      -Return false

=end

def include?(arr, search_val)
  arr.each do |element|
    return true if element == search_val
  end
  false
end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

###############

=begin

Write a method that takes a positive integer, n, as an argument, and displays 
a right triangle whose sides each have n stars. The hypotenuse of the triangle 
(the diagonal side in the images below) should have one end at the lower-left 
of the triangle, and the other end at the upper-right.

Understannding the Problem:
  -Input: Positive integer
  -Output: String, in specific formation

  -Rules:
    -Thge integer input will dictate the height and width of a triangle
    -The triangle will be displayed using the star key (*)
    -The triangle height and width will be equal to the input integer
    -The triangle will start at the bottom right
    -The acute points of the triangle will be at the bottom left and top right of the triangle

Test Cases:
triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Data Structures:
  -Array and strings

Algorithm:
  -Call the #times method on the input number
    -Puts the result of
      -multiply the input number with the string '*' and 
      -right justify with an argument of input number

=end

def triangle(num)
  num.downto(1).each do |n|
    puts ('*' * (n)).ljust(num)
  end
end

# triangle(3)
# triangle(5)
# triangle(10)
# triangle(15)



###############

=begin

Write a method that combines two Arrays passed in as arguments, and 
returns a new Array that contains all elements from both Array arguments, 
with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have 
the same number of elements.

Understannding the Problem:
  -Input: 2 arrays
  -Output: new array

  -Rules:
    -Method takes in two arrays as arguments
    -Both methods are not empty
    -Both methods have an equal amount of elements
    -Set new array to []
    -Iterate through both input arrays
      -push elements from both input arrays with the same index into the new array
      -repeat untill all elements have been entered 
    -Return new array

Test Cases:
  interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Data Structures:
  -array

Algorithm:
  -Set 'combined_arr' to []
  -Iterate thrtough the arrays based on their index
    -Each input arr pushes the element at the current index in the iteration to 'combined_arr'
  -Return 'combined_arr'

=end

def interleave(arr1, arr2)
  combined_arr = []
  arr1.length.times do |index|
    combined_arr.push(arr1[index], arr2[index])
  end 
  combined_arr
end

# OR

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

###############

=begin

Write a method that takes a string, and then returns a hash that contains 
3 entries: one represents the number of characters in the string that are 
lowercase letters, one the number of characters that are uppercase letters, 
and one the number of characters that are neither.

Understannding the Problem:
  -Input: string
  -Output: hash, with 3 entries

  -Rules:
    -Method takes in a string as an argument
    -Returns a hash containing 3 things:
      -num of lowercase letters in string
      -num of uppercase letters in string
      -num of characters that are not letters

Test Cases:
  letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

Data Structures:
  -strings and hash

Algorithm:
  -set 'hash' to equal {}
  -set 'split_str' to the input string split into an array of characters
  -find number of all lowercase letters
  -find number of all uppercase letters
  -find number of all other characters
  -Add these numbers as key/value pairs to 'hash'

=end

def letter_case_count(str)
  count_hash = {}
  split_str = str.chars
  count_hash[:lowercase] = split_str.select { |char| char =~ /[a-z]/ }.length
  count_hash[:uppercase] = split_str.select { |char| char =~ /[A-Z]/ }.length
  count_hash[:neither] = split_str.select { |char| char =~ /[^A-z]/ }.length
  count_hash
end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

###############

=begin

Write a method that takes a single String argument and returns a new string 
that contains the original value of the argument with the first character of 
every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Understannding the Problem:
  -Input: string
  -Output: string

  -Rules:
    -Takes in a string as an argument
    -Capitalizes the first character in each word 
    -Downcases all other letters in word
    -returns modified string

Test Cases:
  word_cap('four score and seven') == 'Four Score And Seven'
  word_cap('the javaScript language') == 'The Javascript Language'
  word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

Data Structures:
  -strings and arrays

Algorithm:
  -Split input string into an array of words, splitting at every ' '
  -Iterate through the array
    -Call #capitalize method on each word
  -Join array back into string
  -Return modified string

=end

def word_cap(str)
  str.split.map do |word| 
    word[0] = word[0].upcase 
    word
  end.join(' ')
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

###############

=begin

Write a method that takes a string as an argument and returns a new string in 
which every uppercase letter is replaced by its lowercase version, and every 
lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Understanding the Problem:
  -Input: string 
  -Output:  string

  -Rules:
    -Method takes a string in as an argument
    -Returns a new string with the case of the letters swapped
      -Uppercase letters will be lowercase
      -Lowercase letters will be uppercase
      -All other characters will be ignored
    -Do not use the String#swapcase method

Test Cases:
  swapcase('CamelCase') == 'cAMELcASE'
  swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
  
Data Structures:
  -strings and arrays

Algorithm:
  -Set 'str_chars' to the input string split into an array of characters
  -Iterate through 'str_chars'
    -If the current character is uppercase
      -Change it to lowercase
    -If the current character is lowercase
      -Change it to uppercase
    -Otherwise
      -Do nothing
  -Join 'str_char' back to a string
  -Return string

=end

def swapcase(str)
  str_chars = str.chars
  str_chars.map do |char|
    if char.match?(/[a-z]/)
      char.upcase
    elsif char.match?(/[A-Z]/)
      char.downcase
    else
      char
    end
  end.join
end 

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

###############

=begin

Write a method that takes a String as an argument, and returns a new String that 
contains the original value using a staggered capitalization scheme in which every 
other character is capitalized, and the remaining characters are lowercase. 
Characters that are not letters should not be changed, but count as characters 
when switching between upper and lowercase.

Understannding the Problem:
  -Input: String
  -Output: String

  -Rules:
    -Method takes in a string as an argument
    -Returns a new string version of the original string with the capitalization staggered
      -Every other character is capitalized
      -Remaining characters are lowercase
      -Non-letter characters are unchanged but are counted as characters when determining case

Test Cases:
  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  staggered_case('ALL_CAPS') == 'AlL_CaPs'
  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Data Structures:
  -Strings and Arrays

Algorithm:
  -Split input string into characters and assign array to 'split_str'
  -Iterate through 'split_str'
    -If character index is even
      -Capitalize character
    -Otherwise
      -Lowercase character
  -Join array to string and return

=end

def staggered_case(str, swap_every_char=false)
  new_str = ''
  up_case = true
  str.chars.each_with_index do |char, index|
    if char.match?(/[^A-z]/)      # if 'char' is any character other than a letter...
      new_str << char               # push character to 'new_str'
      if swap_every_char == true    # if every character should swap case...
        up_case = !up_case            # swap case
      end
    else                          # if it is a letter
      if up_case == true            # if 'up_case' is true
        new_str << char.upcase        # push the uppercased character to 'new_str'
        up_case = !up_case            # swap case
      else                          # if 'up_case' is false
        new_str << char.downcase      # push down cased character to 'new_str'
        up_case = !up_case            # swap case
      end
    end
  end
  new_str                         # return 'new_str'
end

# p staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS', true) == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


###########

=begin

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Understannding the Problem:
  -Input: string
  -Output: array

  -Rules:
    -Method input is a string
    -Returns an array of sub_strings that start at beginning of string
    -ordered shortest to longest

Test Cases:
  leading_substrings('abc') == ['a', 'ab', 'abc']
  leading_substrings('a') == ['a']
  leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Data Structures:
  -strings and arrays

Algorithm:
  -Split input string into array of characters
  -initialize temp_str to ''
  -Iterate through the array of characters
    -concatenate current interation to temp_str and push to new arr
    -return new array

=end

def leading_substrings(str)
  arr = str.chars
  temp_str = ''
  arr.each_with_object([]) do |char, final_arr|
    temp_str += char
    final_arr << temp_str
  end
end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


###########

=begin

Write a method that takes an Array of integers as input, multiplies all 
the numbers together, divides the result by the number of entries in the 
Array, and then prints the result rounded to 3 decimal places. Assume 
the array is non-empty.

Understannding the Problem:
  -Input: Array of integers
  -Output: Float, rounded to 3 decimal points

  -Rules:
    -Method takes in an array of integers
    -Multiplies all the numbers together
    -Divides the result by the length of the array
    -Round result to 3 decimal point
    -Return float number

Test Cases:
  show_multiplicative_average([3, 5])                # => The result is 7.500
  show_multiplicative_average([6])                   # => The result is 6.000
  show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

Data Structures:
  -Arrays, integers, floats

Algorithm:
  -Multiply array integers together
  -Divide the result by the length of the input array
  -Round the result down to 3 decimal points
  -Return float number

=end

def show_multiplicative_average(arr)
  result = (arr.reduce(:*).to_f / arr.length).round(3)
  "%.3f" % result
end

# puts show_multiplicative_average([3, 5])                # => The result is 7.500
# puts show_multiplicative_average([6])                   # => The result is 6.000
# puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

###########

=begin

Write a method that takes two Array arguments in which each Array contains a list 
of numbers, and returns a new Array that contains the product of each pair of 
numbers from the arguments that have the same index. You may assume that the arguments 
contain the same number of elements.

Understannding the Problem:
  -Input: 2 arrays
  -Output: 1 array

  -Rules:
    -Method takes in 2 arrays of integers
    -Multiply the integers from each input array that share index numbers
    -Save the product of that muliplication in a new array
    -return the new array
    -Arrays are the same length

Test Cases:
  multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]  

Data Structures:
  -Arrays and integers

Algorithm:
  -Iterate through one of the arrays
    -Using the index of one array multiply the integers of both input arrays 
      at the current index iteration
    -Save the product in a new array
    -Return the new array

=end

def multiply_list(arr1, arr2)
  combined_arr = []

  # arr1.each_with_index do |num, index|
  #   combined_arr << (num * arr2[index])
  # end

  # OR

  arr1.zip(arr2) { |a, b| combined_arr << a * b }

  combined_arr
end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

###########

=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of every pair of numbers that can be formed 
between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Understannding the Problem:
  -Input: 2 arrays
  -Output: 1 array

  -Rules:
    -Takes two arrays of integers as an argument
    -Make a new array that contains the product of every possible pair of integers 
      between the two array arguments
    -Return the new array sorted by increasing value

Test Cases:
  multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Data Structures:
  -integers and arrays

Algorithm:
  -Create new empty array
  -Iterate through the first array
    -Iterate through the second array
      -add each element of first array to each iteration of array 2 and add them to the new array
  -Sort new array from least to greatest
  -Return new array

=end

def multiply_all_pairs(arr1, arr2)
  arr1.each_with_object([]) do |element_1, result|
    arr2.each { |element_2| result << element_1 * element_2 }
  end.sort
end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

###########

=begin

Write a method that returns the next to last word in the String passed to it as an argument.
Words are any sequence of non-blank characters.
You may assume that the input String will always contain at least two words.

Understanding the Problem:
  -Input: string
  -Output: string

  -Rules:
    -Takes in a string as a parameter
    -Returns the second to last word within the string argument
    -Words are any sequence of non-blank characters
    -String argument will always contain at least 2 words

Test Cases:
  penultimate('last word') == 'last'
  penultimate('Launch School is great!') == 'is'

Data Structures:
  -Strings and arrays

Algorithm:
  -Break input string into an array of words
  -Words are characters separated by a blank space
  -Find and return the 2nd from last element in array

=end

def penultimate(str)
  str.split[-2]
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

###########

=begin
A double number is a number with an even number of digits whose left-side digits 
are exactly the same as its right-side digits. For example, 44, 3333, 103103, 
7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless 
the argument is a double number; double numbers should be returned as-is.

Understannding the Problem:
  -Input: integer
  -Output: integer

  -Rules:
    -What is a double number?
      -A double number is an integer, when split in half by the number of digits 
      its comprised of, its left side and right side are equal.
    -Method will return the input integer multiplied by 2
    -Unless the input integer is a double number, inwhich case return the input integer

Test Cases:
  twice(37) == 74
  twice(44) == 44
  twice(334433) == 668866
  twice(444) == 888
  twice(107) == 214
  twice(103103) == 103103
  twice(3333) == 3333
  twice(7676) == 7676
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
  twice(5) == 10

Data Structures:
  -integers, strings, arrays

Algorithm:
  -if input integer contains an even number of digits
    -convert integer to string
    -split string into 2 even length strings down the middle
    -if strings are equal
      -return input integer
    -otherwise
      -return input integer times 2

=end

def twice(num)
  str = num.to_s
  if str.length.even?
    sub_str = str.slice(0, str.length / 2)
    sub_str2 = str.slice(str.length / 2 , str.length / 2)
    return num if sub_str == sub_str2
  end
  num * 2
end

# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5)= 10

###########

=begin

Write a method that takes a number as an argument. If the argument 
is a positive number, return the negative of that number. If the 
number is 0 or negative, return the original number.

Understanding the Problem:
  -Input: Integer
  -Output: Integer

  -Rules:
    -Method takes in an integer as a parameter
    -Checks if the Integer object is positive, zero or negative
    -if positive
      -returns the negative version of the positive integer
    -otherwise
      -returns Integer object

Test Cases:
  negative(5) == -5
  negative(-3) == -3
  negative(0) == 0      # There's no such thing as -0 in ruby

Data Structures:
  -integer

Algorithm:
  -if input integer is greater than 0
    -return negative version of input integer
  -otherwise
    -return input integer

=end

def negative(num)
  num > 0 ? -num : num
end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

###########

=begin

Write a method that takes an integer argument, and returns an 
Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer 
that is greater than 0.

Understannding the Problem:
  -Input: Integer 
  -Output: Array

  -Rules:
    -Method takes in an Integer object as a parameter
    -Returns an array of integers from 1 to the input integer
    -Input integer will always be a valid integer greater than 0

Test Cases:
  sequence(5) == [1, 2, 3, 4, 5]
  sequence(3) == [1, 2, 3]
  sequence(1) == [1]

Data Structures:
  -Integers and arrays

Algorithm:
  -Create a range from 1 to the input integer and convdert to an array
  -Return array

=end

# def sequence(number)
#   range_arr = []
#   if number.positive?
#     1.upto(number) { |num| range_arr << num }
#   else
#     number.upto(1) { |num| range_arr << num }
#   end
#   range_arr
# end

def sequence(number)
  number.positive? ? (1..number).to_a : (number..1).to_a
end

# p sequence(5) # == [1, 2, 3, 4, 5]
# p sequence(3) # == [1, 2, 3]
# p sequence(1) # == [1]
# p sequence(-5)
# p sequence(0)

###########

=begin

Write a method that takes a string argument, and returns true 
if all of the alphabetic characters inside the string are 
uppercase, false otherwise. Characters that are not alphabetic 
should be ignored.

Understanding the Problem:
  -Input: string
  -Output: boolean

  -Rules:
    -Method takes a string object as an argument
    -Returns a boolean
      -true if all alphabetic characters in the string are upper case
      -otherwise false
    -Non alphabetic numbers should be ignored

Test Cases:
  uppercase?('t') == false
  uppercase?('T') == true
  uppercase?('Four Score') == false
  uppercase?('FOUR SCORE') == true
  uppercase?('4SCORE!') == true
  uppercase?('') == true

Data Structures:
  -strings, arrays, booleans

Algorithm:
  -create an array containing all alphabetic character of input string
  -iterate through array
    -if each character is the same as itself with the #upcase method called on it
      -return true
    -otherwise
      -return false

=end

def uppercase?(string)
  letter_arr = string.scan(/[A-Za-z]/)
  letter_arr.each do |char|
    return false if char != char.upcase
  end
  true
end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

###########

=begin

Write a method that takes a string as an argument, and returns 
an Array that contains every word from the string, to which you 
have appended a space and the word length.

You may assume that words in the string are separated by exactly 
one space, and that any substring of non-space characters is a word.

Understanding the Problem:
  -Input: string
  -Output: array of strings

  -Rules:
    -Method takes in a string as an argument
    -The string contains words seprated by one space
    -Any sunstring of non-space characters is considered a word
    -Return an array containing each individual word from the input 
    string with a space and the length of the string concatenated 
    onto the end of the string

Test Cases:
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

Data Structures:
  -strings, arrays

Algorithm:
  -Split input string into an array of indiviual strings
  -Iterate through the array
    -Concatenate a space and the length of each string onto the end of each string
  -Return string

=end

def word_lengths(string)
  string.split.map { |word| word + " #{word.length}" }
end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []

###########

=begin

Write a method that takes a first name, a space, and a last name 
passed as a single String argument, and returns a string that 
contains the last name, a comma, a space, and the first name.

Understanding the Problem:
  -Input: string
  -Output: string

  -Rules:
    -Method takes a string as an argument
    -The input string will consist of a first name, a space, and a last name.
    -Return a new string that consists of the last name, a comma, a space and the first name

Test Cases:
  swap_name('Joe Roberts') == 'Roberts, Joe'

Data Structures:
  -strings and arrays

Algorithm:
  -Split input string into an array of words
  -Return a new string properly formatted

=end

def swap_name(name)
  name_arr = name.split
  "#{name_arr[1]}, #{name_arr[0]}"
end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

###########

=begin

Create a method that takes two integers as arguments. The first 
argument is a count, and the second is the first number of a 
sequence that your method will create. The method should return 
an Array that contains the same number of elements as the count 
argument, while the values of each element will be multiples of 
the starting number.

You may assume that the count argument will always have a value 
of 0 or greater, while the starting number can be any integer 
value. If the count is 0, an empty list should be returned.

Understanding the Problem:
  -Input: 2 integers
  -Output: array

  -Rules:
    -Method takes two integer objects as arguments
      -The first is a count
      -The second is the first number of a sequence
    -The method will return an array equal in length to the count argument
    -The values of each element will be multiples of the starting number
    -Count will always have a value greater than 1
    -Starting number can be any integer
    -If count is 0 an empty array should be returned

Test Cases:
  sequence(5, 1) == [1, 2, 3, 4, 5]
  sequence(4, -7) == [-7, -14, -21, -28]
  sequence(3, 0) == [0, 0, 0]
  sequence(0, 1000000) == []

Data Structures:
  -integers and arrays

Algorithm:
  -initialize an empty array
  -call the #times method on the count argument
    -push the sum of count plus one multiplied by the value argument
  -return the array

=end

def sequence(count, value)
  range_arr = []
    count.times do |num|
    range_arr << (num + 1) * value
  end
  range_arr
end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

###########

=begin

Write a method that determines the mean (average) of the 
three scores passed to it, and returns the letter value 
associated with that grade.

Tested values are all between 0 and 100. There is no need 
to check for negative values or values greater than 100.

Understanding the Problem:
  -Input: 3 integers
  -Output: string

  -Rules:
    -Three integer objects will be passed in as arguments
    -Find the average of the 3 integer inputs
    -Return the associated letter score for the average
    -Test values are all between 0 and 100
    -No need to check for neg values or values greater than 100

Test Cases:
  get_grade(95, 90, 93) == "A"
  get_grade(50, 50, 95) == "D"

Data Structures:
  -integers, strings

Algorithm:
  -Assign 'average' to 3 integer inputs added together and divided by 3
  -Run the 'average' through a case statement and return the appropriate letter grade

=end

def get_grade(score_a, score_b, score_c)
  average = (score_a + score_b + score_c) / 3
  case average
  when 90...    then "A"
  when 80..89   then "B"
  when 70..79   then "C"
  when 60..69   then "D"
  else               "F"
  end
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

###########

=begin

Write a method which takes a grocery list (array) of fruits with 
quantities and converts it into an array of the correct number 
of each fruit.

Understanding the Problem:
  -Input: An array of arrays
  -Output: An array

  -Rules:
    -Method takes in an array of arrays as an argument
    -Each sub-array contains a string object and an integer object
    -Return a new array with the string from each sub-array equal 
    to the integer.

Test Cases:
  buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data Structures:
  -strings, integers, arrays

Algorithm:
  -Initialize 'fruit_arr' to and empty array
  -Iterate through the input array
    -For each sub-array
      -push the current string iteration to 'fruit_arr' a number of times equal to the integer iteration
  -return 'fruit_arr'

=end

def buy_fruit(array)
  fruit_arr = []
  array.each do |sub_array|
    sub_array.last.times { |_| fruit_arr << sub_array[0] }
  end
  fruit_arr
end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
# ["apples", "apples", "apples", "orange", "bananas","bananas"]

###########

=begin

Write a program that prints out groups of words that are anagrams. 
Anagrams are words that have the same exact letters in them but 
in a different order. Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

Understanding the Problem:
  -Input: Array of strings
  -Output: A series of arrays

  -Rules:
    -Method takes in an array of strings
    -The method will sort through the strings and return an array 
    or arrays of all words that are anagrams

Test Cases:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Data Structures:
  -strings, arrays

Algorithm:
-Initialize 'anagrams' to an empty array
  -Iterate through input array
    -Split current string in iteration by character
    -Sort the characters
    -Iterate through the input array again
      -Split current string in iteration by character
      -Sort the characters
      -Compare current split and ordered array with the parent 
      split and sorted array
      -If two array match add each to 'anagrams' array
  -Return 'anagrams'

=end

def find_anagrams(arr)
  final_anagrams = []
  arr.each do |word|
    sorted_word = word.chars.sort
    temp_arr = arr.each_with_object([]) do |word_inner, anagrams|
      if word_inner.chars.sort == sorted_word
        anagrams << word_inner 
      end
    end
    final_anagrams << temp_arr
  end
  final_anagrams.uniq.each { |arr| puts arr.to_s }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

# find_anagrams(words)

###########

=begin

Write a method that takes a floating point number that represents 
an angle between 0 and 360 degrees and returns a String that 
represents that angle in degrees, minutes and seconds. You should 
use a degree symbol (°) to represent degrees, a single quote (') 
to represent minutes, and a double quote (") to represent seconds. 
A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round 
values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting 
the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

Understanding the Problem:
  -Input: Integer
  -Output: String

  -Rules:
    -Method will take in an integer as an argument
    -The input integer 

Test Cases:
  dms(30) == %(30°00'00")
  dms(76.73) == %(76°43'48")
  dms(254.6) == %(254°36'00")
  dms(93.034773) == %(93°02'05")
  dms(0) == %(0°00'00")
  dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Data Structures:
  -

Algorithm:
  

=end

###########

=begin

Write a method that takes an Array of numbers and then returns 
the sum of the sums of each leading subsequence for that Array. 
You may assume that the Array always contains at least one number.

Understanding the Problem:
  -Input: Array of integers
  -Output: Integer

  -Rules:
    -Method takers an array of integers as an argument
    -The input array will always have at least one element 
    -Return a new array with an equal amount of elements as the input array
      -Each element will be the sum of all elements up until the current integer
      -Find the sum of all the sums in the new array
    -Return the sum of sums 

Test Cases:
  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
  sum_of_sums([4]) == 4
  sum_of_sums([1, 2, 3, 4, 5]) == 35

Data Structures:
  -Integers and Arrays

Algorithm:
  -Iterate through the input array
  -Add the sum of each iteration and all previous sums to a new array
  -Find and return the sum of the array of sums

=end

def sum_of_sums(array)
  sum = 0
  array.map { |number| sum += number }.sum
end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

###########

=begin

Mad libs are a simple game where you create a story template with 
blanks for words. You, or another player, then construct a list 
of words and place them into the story, creating an often silly 
or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, 
an adverb, and an adjective and injects those into a story that 
you create.

Understanding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:
  Enter a noun: dog
  Enter a verb: walk
  Enter an adjective: blue
  Enter an adverb: quickly

  Do you walk your blue dog quickly? That's hilarious!

Data Structures:
  -

Algorithm:
  

=end

def mad_lib
  puts "=> Enter a noun:"
  noun = gets.chomp
  puts "=> Enter a verb:"
  verb = gets.chomp
  puts "=> Enter a adjective:"
  adjective = gets.chomp
  puts "=> Enter a adverb:"
  adverb = gets.chomp

  puts "Why does the #{noun} #{verb} with their #{adjective} passengers #{adverb}? Because its nuts!"
end

# mad_lib

###########

=begin

Write a method that returns a list of all substrings of a string 
that start at the beginning of the original string. The return 
value should be arranged in order from shortest to longest substring.

Understanding the Problem:
  -Input: string
  -Output: array

  -Rules:
    -Takes in a string as an argument
    -Returns an array containing all substrings that start with at the 
    beginning of the input string
    -Sub-strings should be ordered from shortest to longest

Test Cases:
  leading_substrings('abc') == ['a', 'ab', 'abc']
  leading_substrings('a') == ['a']
  leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Data Structures:
  -strings and arrays

Algorithm:
  -Initialize an emoty array
  -Iterate through the string using its length
    -Push 1 char long substring to new array
    -Incrememnt the length of the substring and repeat
  -Return new array

=end

def leading_substrings(string)
  sub_strings = []
  string = string.downcase.gsub(/[^0-9a-z ]/i, '')
  1.upto(string.size) do |length|
    sub_strings << string.slice(0, length)
  end
  sub_strings
end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

###########

=begin

Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the 
substring begins. This means that all substrings that start at 
position 0 should come first, then all substrings that start at 
position 1, and so on. Since multiple substrings will occur at each 
position, the substrings at a given position should be returned 
in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote 
in the previous exercise:

Understanding the Problem:
  -Input: string
  -Output: array

  -Rules:
    -Method takes in a string as an argument
    -The method will return an array containiing all sub-strings of the input string
    -The substrings will be ordered by where in the string the sub-string begins
      -For example, all sub-strings that start at index 0 will be before sub-strings 
      that begin at index 1
      -All sub-strings starting at the same index should be ordered shortest to longest

Test Cases:
  substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]

Data Structures:
  -string and array

Algorithm:
  

=end

def substrings(string)
  sub_strings = []
  str_length = string.length
  
  0.upto(string.size - 1) do |index|
    sub_str = string.slice(index, str_length)
    sub_strings << leading_substrings(sub_str)
    str_length -= 1
  end

  sub_strings.flatten
end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

###########

=begin

Write a method that returns a list of all substrings of a string 
that are palindromic. That is, each substring must consist of the 
same sequence of characters forwards as it does backwards. The 
return value should be arranged in the same sequence as the 
substrings appear in the string. Duplicate palindromes should 
be included multiple times.

You may (and should) use the substrings method you wrote in the 
previous exercise.

For the purposes of this exercise, you should consider all characters 
and pay attention to case; that is, "AbcbA" is a palindrome, but 
neither "Abcba" nor "Abc-bA" are. In addition, assume that single 
characters are not palindromes.

Understanding the Problem:
  -Input: string
  -Output: array

  -Rules:
    -Method takes inn a string as an argument
    -Returns an array of all sub-strings that are palindromes
      -Each sub-string that is the same backwards as forwards
    -The order should be the same as the sub-strings appear in the string
    -Duplicate palindromes should all be included
    -Use the #substrings method written above
    -All characters are considered
    -Case sensetive
    -Single character sub-strings are not palindromes

Test Cases:
  palindromes('abcd') == []
  palindromes('madam') == ['madam', 'ada']
  palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
  ]
  palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]

Data Structures:
  -strings and arrays

Algorithm:
  -Get an array of all substrings of the input string
  -Initialize new_arr to an empty array
  -Iterate through the sub-strings array
    -If string is more than one char long and the same forward and backward
      -Push to new_array
  -Return new_array

=end

def palindromes(string)
  sub_strings = substrings(string)
  palindromes = sub_strings.select do |sub_str|
    sub_str.length > 1 && sub_str == sub_str.reverse
  end
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

###########
=begin

Write a method that takes two arguments: the first is the 
starting number, and the second is the ending number. Print 
out all numbers between the two numbers, except if a number 
is divisible by 3, print "Fizz", if a number is divisible by 
5, print "Buzz", and finally if a number is divisible by 3 and 5, 
print "FizzBuzz".

Understanding the Problem:
  -Input: 2 integers, a starting number and an ending number
  -Output: Print out pattern

  -Rules:
    -Take in 2 integers as argument
    -The first is the starting number
    -The second is the ending number
    -Print all numbers between the starting and ending numbers
      -The starting and ending numbers are included
    -If a number is divisible by 3
      -Print 'Fizz' instead of the number
    -If a number is divisible by 5
      -Print 'Buzz' instead of the number
    -If a number is divisible by 3 and 5
      -Print 'Fizz Buzz' instead of the number
    

Test Cases:
  fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

Data Structures:
  -Strings and integers

Algorithm:
  -Loop or iterate through the range of numbers
    -If the current iteration is divisible by 3
      -Print 'Fizz'
    -If the current iteration is divisible by 5
      -Print 'Buzz'
    -If divisible by 3 and 5
      -Print 'Fizz Buzz'
    -Otherwise
      -Print the current iteration integer

=end

def fizzbuzz(start_num, end_num)
  fizzbuzz_arr = []
  (start_num..end_num).each do |num|
    case
    when (num % 3 + num % 5) == 0 then fizzbuzz_arr << 'FizzBuzz' 
    when num % 3 == 0             then fizzbuzz_arr << 'Fizz'
    when num % 5 == 0             then fizzbuzz_arr << 'Buzz' 
    else                               fizzbuzz_arr << num
    end
  end
  display_fizzbuzz(fizzbuzz_arr)
end

def display_fizzbuzz(array)
  array.each do |element|
    puts element
    puts ' '
  end
end

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

###########

=begin


Understanding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:


Data Structures:
  -

Algorithm:
  

=end

###########

=begin


Understanding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:


Data Structures:
  -

Algorithm:
  

=end

###########

=begin


Understanding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:


Data Structures:
  -

Algorithm:
  

=end

###########

=begin


Understanding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:


Data Structures:
  -

Algorithm:
  

=end

###########

=begin


Understanding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:


Data Structures:
  -

Algorithm:
  

=end