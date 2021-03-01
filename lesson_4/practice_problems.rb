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
