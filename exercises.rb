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
  
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

###########

=begin


Understannding the Problem:
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


Understannding the Problem:
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


Understannding the Problem:
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


Understannding the Problem:
  -Input: 
  -Output: 

  -Rules:
    -

Test Cases:


Data Structures:
  -

Algorithm:
  

=end