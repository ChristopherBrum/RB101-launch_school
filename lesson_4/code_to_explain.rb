=begin
CONVERT A SIGNED NUMBER TO A STRING

Understand the Problem:
  - INPUT: string
  - OUTPUT: neg or positive integer

  -Takes in a string of digits
  - returns the number as an integer
  - number can be signed either + or - or not signed
  - '+' sign means its a pos integer
  - '-' sign means its an odd integer
  - if there is not sign it should return a positive number
  - Assume string contains valid number
  - Do not use #to_i, Integer()

Test Cases / Examples:
  string_to_signed_integer('4321') == 4321
  string_to_signed_integer('-570') == -570
  string_to_signed_integer('+100') == 100

Data Structure:
  - string input
  - arrays in the method
  - return an integer

Algorithm:
  - Will use string_to_int method from the last exercise to convert from string to integer.

  - Method will take in a string as an argument
    - heck to see if the first character of input string is the character '+' or '-'.
    - if the first char is '+'
      - set variable 'is_pos?' to true 
      - remove first char
    - if the first char is '-'
      - set variable 'is_true?' to false
      - remove first char

    - set 'integer' to the invoked string_to_int method passing string input as the argument
    - if 'is_pos?' is true 
      -return 'integer'
    - otherwise 
      - return -'integer'

Code:
=end
DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(str)
  numbers = str.chars
  if numbers[0] == '+' || numbers[0] == '-'
    numbers.shift
  end
  arr_of_nums = numbers.map { |str_num| DIGITS[str_num] }

  value = 0
  arr_of_nums.each do |digit|
    value = 10 * value + digit
  end
  value
end


def string_to_signed_integer(string)
  is_pos = true 
  is_pos = false if string[0] == '-' 

  num = string_to_integer(string)

  is_pos ? num : -num
end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100



################
=begin
Understanding the Problem:
  -INPUT: string
  -OUTPUT: boolean

  -Rules:
    -There is a collection of word blocks containing 2 letters per element connected by a colon.
    -Method will take in a string as an argument.
    -Determine whether the charcters of the input string correlate with only one of the letters any of the spelling blocks in the collection given.
    -Return true if the string characters only correlate with one of any of the spelling block elements. 
    -Return false if the string characters  correlate with more than one of any of the spelling block elements. 

Test Cases / Examples:
  collection of a spelling block:
    B:O   X:K   D:Q   C:P   N:A
    G:T   R:E   F:S   J:W   H:U
    V:I   L:Y   Z:M

  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true

Data Structures:
  -strings, arrays and booleans

Algorithm:
  -set 'str_arr' to the input string split into an array of characters
  -down case all charcters in 'str_arr'
  -iterate through 'SPELLING_BLOCK'
    -split each element at ':'
    -iterate through the 2 elements
      -check to see if 'str_arr' includes the first element and (&&) the second element
      -if true, return false
  -return true

Code:
=end

SPELLING_BLOCK = %w(B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M)

def block_word?(string)
  one_char_max = true
  str_arr = string.chars.map { |el| el.downcase }
  SPELLING_BLOCK.each do |block|
    block = block.split(':')
    one_char_max = false if (str_arr.include?(block[0].downcase)
                          && str_arr.include?(block[1].downcase))
  end
  one_char_max
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
