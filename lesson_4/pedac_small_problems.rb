# Write a method that takes two strings as arguments, 
# determines the longest of the two strings, and then 
# returns the result of concatenating the shorter string, 
# the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# -Explicit Requirements:
#   INPUT: 2 strings of differnet length
#   OUTPUT: 1 new string
#   -The method takes 2 strings as argunments
#   -Determine the longest of the 2 strings
#   -Concatenate the shorter string with the longer and the shorter again
#   -Return the new string
#   -Strings are of different lengths

# -Implicit Requirements:
#   -No spaces between the strings
#   -Empty string is still treated as a string

# Data Structure:
#   -Strings

# Algorithm:
#   -Determine longer of the two string parameters
#   -Set longer string to variable 'long_string'
#   -Set shorter string to variable 'short-string'
#   -Concatenate 'short_string' with 'long_string' and 'short_string', again, 
#     and set new string to variable 'final_string'
#   -Return 'final_string'

def short_long_short(str1, str2)
  if str1.length > str2.length
    long_string = str1
    short_string = str2
  else
    long_string = str2
    short_string = str1
  end
  short_string + long_string + short_string
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"




#######################

# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number, 
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 
# 1901-2000 comprise the 20th century.

# -Explicit Rules;
#   -INPUT: An integer (year as an integer)
#   -OUTPUT: A string (century as a string)
#   -Method takes in a year in the form of an integer as an argument
#   -Returns a string of the century the argument falls into.
#   -Centuries start at year xx01 and end at xx00
#   -The century string should append the appropriate ending to the century. 
#     -ie. 'st', 'nd', 'rd', 'th'
# -Implicit Rules:
#   -Centuries round up

# -Data Structure:
#   -strings

# -Algorithm:
#   -Save the year parameter divided by 100 and rounded up to 'century'
#   -If 'last_years' is greater than 0 increment the 'century' by 1
#   -Concat the appropriate ending onto 'century'
#   -Return 'century'

# -Code:
def century(year)
  century = isolate_century(year)
  year_end = get_end_of_century(century)
  century = add_ordinal_to_number(year_end, century)
end

def isolate_century(year)
  if year % 100 != 0  
    century = (year / 100) + 1
  else 
    century = year / 100
  end 
end

def get_end_of_century(century)
  if century > 100
    year_end = century.remainder(100)
  else
    year_end = century
  end
end

def add_ordinal_to_number(year_end, century)
  if year_end.to_s[-2, 2] == '11' ||
     year_end.to_s[-2, 2] == '12' ||
     year_end.to_s[-2, 2] == '13'
    century = century.to_s + 'th'
  elsif year_end.to_s[-1] == '1'
    century = century.to_s + 'st'
  elsif year_end.to_s[-1] == '2'
    century = century.to_s + 'nd'
  elsif year_end.to_s[-1] ==  '3'
    century = century.to_s + 'rd'
  else
    century = century.to_s + 'th'
  end
end

#-Test Cases
century(8112) == '82nd'
century(2110) == '22nd'
century(2000) == '20th'
century(2001) == '21st'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(11201) == '113th'
century(1965) == '20th'
century(1052) == '11th'
century(1127) == '12th'




#############

# In the modern era under the Gregorian Calendar, 
# leap years occur in every year that is evenly divisible by 4, 
# unless the year is also divisible by 100. If the year is evenly 
# divisible by 100, then it is not a leap year unless the year 
# is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. 
# Write a method that takes any year greater than 0 as input, 
# and returns true if the year is a leap year, or false if it 
# is not a leap year.

# -INPUT: integer
# -OUPUT: boolean, true if it is a leap year and false if not
# -Questions: 
#   -What is a leap year?
#   -Leap year occurs every that is evenly divisible by 4.
#     -Unless the year is also divisible by 100.
#       -But if it is divisble by 400 then it is a leap year.
#   -When does the years start? 
#     -Years starting from 0 and beyond.

# -Explicit Rules:
#   -Input will be an integer greater than zero
#   -
# -Implicit Rules:

# -Test Cases:
# leap_year?(2016) == true
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(2000) == true
# leap_year?(1752) == true
# leap_year?(400) == true

# Not devisible by 4
# leap_year?(2015) == false
# leap_year?(240001) == false
# leap_year?(1) == false

# Divisable by 4 and 100
# leap_year?(100) == false

# Divisable by 4, and 100 but not 400 
# leap_year?(2100) == false
# leap_year?(1900) == false
# leap_year?(1700) == false


# -Data Structure: 
#   -integers

# -Algorithm:
#  -Method will have an integer as a parameter
#  -Check if integer is divisible by 400, 100 and 4
#   -if yes then return true
#  -Check to see if integer is divisible by 100 and 4 but not 400
#   -if yes, return false
#  -Check to see if integer is divisible by 4
#   if yes, return true
#  Otherwise return false

# -Code:

def leap_year?(year)
  if year < 1752
    divisble_by_4?(year)
  else
    divisble_by_400?(year) || (!divisble_by_100?(year) && divisble_by_4?(year))
  end
end

def divisble_by_4?(year)
  year.remainder(4) == 0
end

def divisble_by_100?(year)
  year.remainder(100) == 0
end

def divisble_by_400?(year)
  year.remainder(400) == 0
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true



########################
=begin
  Write a method that takes an Array of numbers, and returns 
  an Array with the same number of elements, and each element 
  has the running total from the original Array.

# P
  INPUT: array
  OUTPUT: array
  Explicit Rules:
    -Method takes an array of integers
    -Returns an array of integers with the running total of the integers
    -An empty array will retrun an empty array
  Implicit Rules:
    -All arrays contain only integers
# E
  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []

# D
  -arrays

# A
  -Method will take an array of integers as a parameter
  -Initialize current_total to 0
  -Iterate through the integer array
    -Assign the element from the integer array to current_total plus itself
    -set num to current_total
  -return new array
# C
=end

def running_total(int_arr)
  current_total = 0
  int_arr.map do |num|
    current_total += num
    num = current_total
  end
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []




################
=begin
Write a method that searches for all multiples of 3 or 5 that 
lie between 1 and some other number, and then computes the sum 
of those multiples. For instance, if the supplied number is 20, 
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

-Understand the Problem:
  -INPUT: integer
  -OUTPUT: integer, sum of all the multiples of 3 and 5 found in the 
    integer entered into the method
  -Explicit rules:
    -Method will take in one integer as a parameter.
    -Find all multiples of 3 and 5 from paramenter
    -Find the sum of all multiples
    -return sum

  -Implicit rules:
    -Parameter should be a positive integer

-Examples / Test Cases:
  multisum(3) == 3
  multisum(5) == 8
  multisum(10) == 33
  multisum(1000) == 234168

-Data Structure:
  -integers and array

-Algorithm:
  -Method will have one parameter
  -Initialize 'sum' to an empty array
  -Find all multiples of 3 and 5 in the integer parameter
    -Add all multiples of 3 to the 'sum' array
    -Add all multiples of 5 to the 'sum' array
  -Find the sum of all the integers in the sum array.
  -Return the sum array.

-Code:
=end

def multisum(integer)
  arr_of_multiples = []
  integer.times do |num|
    if (num + 1) % 3 == 0 || (num + 1) % 5 == 0
      arr_of_multiples << (num + 1)
    end
  end
  arr_of_multiples.sum
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168



################
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(food)
  fruit = {}
  counter = 0
  
  loop do
    if food[food.keys[counter]] == 'Fruit'
      fruit[food.keys[counter]] = 'Fruit'
    end

    counter += 1

    break if counter == food.length
  end
  fruit
end

select_fruit(produce)




##############
def double_numbers(num_arr)
  counter = 0
  loop do
    break if counter == num_arr.length
    num_arr[counter] *= 2
    counter += 1
  end
  num_arr
end


my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) == [2, 8, 6, 14, 4, 12]



###############
def double_odd_numbers(arr)
  new_arr = []
  count = 0

  loop do 
    break if count == arr.length

    current_num = arr[count]
    if count.odd?
      new_arr << current_num * 2
    else
      new_arr << current_num
    end
    count += 1
  end
  new_arr
end


my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)



##################
def multiply(arr, multiplier)
  multiplied_arr = []
  counter = 0

  loop do
    break if counter == arr.length
    multiplied_arr << arr[counter] * multiplier
    counter += 1
  end

  multiplied_arr
end


my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]



###############
