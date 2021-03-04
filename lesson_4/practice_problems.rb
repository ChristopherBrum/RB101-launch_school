# What is the return value of the select method below? Why?

# [1, 2, 3].select do |num|
#   num > 5
#   'hi'
# end

# This will return 



################

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]


# hsh = flintstones.map do |name|
#   arr = []
#   arr.push(name)
#   arr.push(flintstones.index(name))
#   arr
# end

# p hsh.to_h



################
# Add up all of the ages from the Munster family hash:

ages = { 
  "Herman" => 32, 
  "Lily" => 30, 
  "Grandpa" => 5843, 
  "Eddie" => 10, 
  "Marilyn" => 22, 
  "Spot" => 237 
}

def total_ages(person_hash)
  combined_ages = 0

  person_hash.each do |_, age|
    combined_ages += age
  end
  combined_ages
end

p total_ages(ages)

=begin
- input string
- case 
- count appearances of character
- hash are key/value - no need to sort

Rules:
- all special chars are ignore and spaces

Output: 
- count is key
- value is alphanumerics that match the key, sorted alphabetically
  - all lowercase
- return empty hash 

Algorithm:
- initialize variable and set it the parameter string split into an array by character
- remove any non-alphanumeric charcters
- downcase all letters
- initialize a variable equal to an empty hash
- iterate through the array
  - find the see the count of a letter within the array
  - if the hash does not contain a key of the letter count add the key and add the letter as its value within an array
  - if the hash key exists push the value to the array associated with that key/letter count
- sort value arrays alphabetically
- return hash 

=end




###########
# Instructions
# Write a method that takes a string as an argument and groups the number of time each character appears in the string as a hash sorted by the highest number of occurrences.

# The characters should be sorted alphabetically. You should ignore spaces, special characters and count uppercase letters as lowercase ones.
  
=begin
- input string
- case 
- count appearances of character
- hash are key/value - no need to sort

Rules:
- all special chars are ignored and spaces also

Output: 
- count is key (integer)
- value is alphanumerics that match the key, sorted alphabetically
  - all lowercase
- return empty hash if no matches


# - create an empty hash
# - convert the string to lowercase.
# -exclude all non alphanumeric characters
# -convert string to an array of chars
# 2 options: 
# - iterate through the array of chars keeping track of count of every letter
# - iterate through array of all alphanumeric characters and see count of each letter

# -convert output to appropriate hash

=end

def get_char_count(str)
  clean_string = str.downcase.delete('^a-z0-9')
  chars_tallied = clean_string.chars.tally
  
  char_count = chars_tallied.each_with_object({}) do |(key, value), hash| 
    hash[value] ? hash[value].push(key) : hash[value] = [ key ]
  end

  char_count.transform_values! { |value| value.sort }
  char_count
end

# p get_char_count("cba") == { 1 => ['a', 'b', 'c'] }
# p get_char_count("Mississippi") == { 4 => ['i', 's'], 2 => ['p'], 1 => ['m'] }
# p get_char_count("Hello. Hello? HELLO!!") == { 6 => ['l'], 3 => ['e', 'h', 'o'] }
# p get_char_count("aaa...bb...c!") == { 1 => ['c'], 2 => ['b'], 3 => ['a'] }
# p get_char_count("aaabbbccc") == { 3 => ['a', 'b', 'c'] }
# p get_char_count("abc123") == { 1 => ['1', '2', '3', 'a', 'b', 'c'] }
# p get_char_count('') == {}
# p get_char_count('...$*,+') == {}





##############
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |_, age| }



##############
statement = "The Flintstones Rock"

str_chars = statement.chars

letters_hash = str_chars.each_with_object({}) do |letter, hash|
  hash[letter] ? hash[letter] += 1 : hash[letter] = 1
end

letters_hash




#############
# numbers = [1, 2, 3, 4]
# numbers.each_with_index do |number, index|
#   p "#{index}  #{numbers.inspect}  #{number}"
#   numbers.shift(1)
# end




############
words = "the flintstones rock"

def titleize(str)
  words = str.split.map do |word|
    word = word[0].upcase + word[1, word.size - 1]
  end.join(' ')
end

titleize(words)



###########
=begin
Modify the hash such that each member of the Munster family has 
an additional "age_group" key that has one of three values describing 
the age group the family member is in (kid, adult, or senior). 
Your solution should produce the hash below...

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }


P: 
  -INPUT: hash
  -OUTPUT: hash with an added age_group to each person in hash

  -Rules:
    -Input hash will be nested
    -There are 3 possible age group's a person can have
    -Each person should be part of an age group
    -What are the age groups?
      - kid < 18
      - 18 <= adult < 100
      - senior >= 100
T: 
  -Test cases found above

D:
  -hashes

A: 
  -Method will take a hash as an input
  -Iterate through the hash
    -check the age of every person
    -assign an age according the the rules

  -return the hash

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def add_age_group(people)
  people.each do |name, nested_hash|
    case nested_hash['age']
    when 1..17
      nested_hash['age_group'] = 'kid'
    when 18..64
      nested_hash['age_group'] = 'adult'
    else
      nested_hash['age_group'] = 'senior'
    end 
  end
end


p add_age_group(munsters)
p add_age_group(munsters) == { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }




  ############
=begin
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
Understand the Problem:
  -INPUT: string
  -OUTPUT: integer

  -Rules:
    -take a string as an input
    -determine the ASCII value of all of the characters of the string combined
    -return the total ASCII value

Test Cases:
  ascii_value('Four score') == 984
  ascii_value('Launch School') == 1251
  ascii_value('a') == 97
  ascii_value('') == 0

Data Structures:
  -strings, array, integer

Algorithm:
  -set 'total' variable to 0
  -split the string by characters
  -iterate through the array
    -find the ascii value of the character and add it to the 'total' variable
  -return 'total'

Code:
=end

def ascii_value(string)
  total = 0
  string.each_char { |char| total += char.ord }
  total
end


ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0



#############
=begin
Understanding the Problem:
  -2 methods here, both input/output is the same:
    -INPUT: String  (in time format)
    -OUTPUT: Integer (minutes )

  -Rules: 
    -Take the string input and break it down into hours and minutes 
    -Calculate those minutes before /after midnight
    -Return minutes before/after midnight
    -Do not use Time or Date classes

Test Cases / Examples:
  after_midnight('00:00') == 0
  before_midnight('00:00') == 0
  after_midnight('12:34') == 754
  before_midnight('12:34') == 686
  after_midnight('24:00') == 0
  before_midnight('24:00') == 0

Data Structures:
  -strings, arrays and integers

Algorithm:
  -before_midnight
    -split input string at ':'
    -assign first element 'hours'
    -assign second element 'minutes'
    -if hours is >= 24 subtract 24 until its < 24
    -multiply hours by 60
    -add hours and minutes together

    -subtract hours from 1440
    -reutrn total

  -after_midnight
    -split input string at ':'
    -assign first element 'hours'
    -assign second element 'minutes'
    -if hours is >= 24 subtract 24 until its < 24
    -multiply hours by 60
    -add hours and minutes together

    -return total

Code:
=end

HOURS_IN_DAY = 24
MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

def before_midnight(time)
  total_minutes = find_minutes(time)
  total_minutes = MINUTES_IN_DAY - total_minutes
  reduce_by_day(total_minutes)
end

def after_midnight(time)
  total_minutes = find_minutes(time)
  reduce_by_day(total_minutes)
end

def find_minutes(time)
  time_str = time.split(':')
  hours = time_str[0].to_i
  minutes = time_str[1].to_i
  total_minutes = (hours * MINUTES_IN_HOUR) + minutes
  total_minutes
end

def reduce_by_day(minutes)
  minutes % MINUTES_IN_DAY
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0


################
=begin
Understand the Problem: 
  -INPUT: string of words
  -OUTPUT: string

  -Rules:
    -Take each word in string (sparated by a space) and swap the first and last charcter
    -Every word contains at least one letter
    -String will always contain at least one word
    -String contains only words and spaces

Test Cases / Examples:
  swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  swap('Abcde') == 'ebcdA'
  swap('a') == 'a'

Data Structures:
  -strings and arrays

Algorithm:
  -split string input at every ' '
  -iterate through the array
    -swap the first and last character of each element
  -join the array
  -return new string

Code:
=end

def swap(sentence)
  string_arr = sentence.split(' ')
  string_arr.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'



##############
=begin
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Understand the Problem:
  -INPUT: string
  -OUTPUT: string

  -Rules: 
    -input string can contain words, non-alphabetic characters and spaces. 
    -replace all non-alphabetic characters with a space (' ')
    -If there is more than one space remove extras and leave one space.
    -return the string

Test Cases:
  cleanup("---what's my +*& line?") == ' what s my line '

Data Structures:
  -string and array

Algorithm:
  -swap all non-alphabetic characters with a space (' ')
  -split the string by ' '
  -join array with ' '
  -return string

Code:
=end

def cleanup(string)
  str = string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

cleanup("---what's my +*& line?")
cleanup("---what's my +*& line?") == ' what s my line '



##############
=begin
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Understanding the Problem:
  -Input: string
  -Output: hash

  -Rules:
    -Takes in a strring of words separated by one or more space.
    -Returns a hash, key is the length of a word and the value is the number of words of that length.
    -Words are considered any characters except spaces.
    -Spaces dillineate a separation of words.

Test Cases:
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
  word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
  word_sizes('') == {}

Data Structures:
  -strings, integers, arrays, hashes

Algorithm:
  -split string at every ' ' into an array of words
  -convert the array of words into an array of word lengths. 
  -iterate through the array and insert length of words and number of words of that length into a hash
=end

def word_sizes(string)
  string_hash = string.split(' ').group_by { |word| word.delete('^A-z').length }
  string_hash.each_with_object({}) do |(length, instances), final_hash| 
    final_hash[length] = instances.length
  end
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}




#################
=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Understanding the Problem:
  -INPUT: array of integers
  -OUTPUT: array of integers

  -Rules:
    -Method takes an array of integers as an argument
    -The integers are between 0 and 19
    -sort the integers alphabetically, based on their english written version

Test Cases:
  alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]

Data Structures:
  -integers, strings, arrays and hash

Algorithm:
  -Initiate 'NUM_WORDS' to an array of the words 'one' through 'nineteen'
  -Initiate 'num_to_words', using the integers of the input array as keys and the strings associated with of 'NUM_WORDS' as the values
  -Iterate through the values of 'num_to_words' and sort alphabetically
  -Using the sorted values, push the associated keys to 'sorted_integers'
  -return 'sorted_integers'

=end

NUM_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  nums_to_strings = arr.each_with_object({}) do |integer, hash|
    hash[integer] = NUM_WORDS[integer]
  end
  nums_to_strings.values.sort.each_with_object([]) do |string, sorted_arr|
    sorted_arr << nums_to_strings.key(string)
  end
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]




################
=begin 
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Understand the Problem:
  -INPUT: string
  -OUTPUT: string 

  -Rules:
    -Method takes in a string
    -Returns a string of the same but with consecutive characters collapsed into one character.
    -Don't use #squeeze or #squeeze!

Test Cases:
  crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  crunch('4444abcabccba') == '4abcabcba'
  crunch('ggggggggggggggg') == 'g'
  crunch('a') == 'a'
  crunch('') == ''

Data Structures:
  -strings, arrays

Algorithm:
  -iterate through input string by character
    -check if current char == the next char
     -if true delete one of the matching characters
  -return string

=end

def crunch(string)
  new_str = []
  str = string.split('')
  str.each_with_index do |char, index|
    new_str.push(char) unless char == str[index + 1] 
  end
  new_str.join
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''




##############
=begin 
Write a method that will take a short line of text, and print it within a box.

You may assume that the input will always fit in your terminal window.

Understand the Problem:
  -INPUT: string
  -OUTPUT:  string

  -Rules:
    -Takes in a string
    -returns the same string within a box
    -the top and bottom of the box consist of '+' at the beginning and end of the line with '-' symbols the length of the string plus 2
    -theres a line on top and on bottom of the the center of the box that starts and ends with '|' and has ' ' the length of the string plus 2
    - The center line will contain the string passed in with a space and '|' on both sides


Test Cases:
  print_in_box('To boldly go where no one has gone before.')
  +--------------------------------------------+
  |                                            |
  | To boldly go where no one has gone before. |
  |                                            |
  +--------------------------------------------+

  print_in_box('')
  +--+
  |  |
  |  |
  |  |
  +--+
Data Structures:
  -strings

Algorithm:
  -assign 'length' to the length of the string input plus 2
  -initialize top line 

=end

def print_in_box(string)
  size = string.length + 2
  top_bottom = "+#{'-' * size}+" 
  space = "|#{' ' * size}|"
  text = "| #{string} |"
  puts top_bottom, space, text, space, top_bottom
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+




##################
