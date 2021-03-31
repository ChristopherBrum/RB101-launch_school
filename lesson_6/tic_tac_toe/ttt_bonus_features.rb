=begin

Currently, we're using the Array#join method, which can only
insert a delimiter between the array elements, and isn't smart
enough to display a joining word for the last element.

Write a method called joinor that will produce the following result:

Test Cases:
  joinor([1, 2])                   # => "1 or 2"
  joinor([1, 2, 3])                # => "1, 2, or 3"
  joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
  joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

The Problem:
  Input: array of integers, separator, (optional) linking word
  Output: string

  Rules:
    -Method will take in
      -an array of integers
      -a separator substring
      -an (optional) connecting string
    -Returns a string of all array integers,
      -each separated by the separator parameter,
      -and with a connecting string parameter that replaces the
        separator parameter between the final two integers
    -The linking words default is set to 'or'

Algorithm:
  -Initialize 'integer_options' an empty string variable
  -Iterate through the integer array
    -If the iteration is the second to last of the array
      -Concatenate the iteration to 'integer_options'
      -Concatenate linking word to 'integer_options'
      -Concatenate a space string(' ') to 'integer_options'
    -If the iteration is the last of the array
      -Concatenate the iteration to 'integer_options'
    -Otherwisae
      -Concatenate the iteration to 'integer_options'
      -Concatenate the separator 'integer_options'
    -Return 'integer_options'

=end

def joinor(arr, separator=', ', link='or')
  integer_options = ''
  arr.each_with_index do |integer, index|
    integer = integer.to_s
    return tiny_joinor(arr) if arr.size < 3
    integer_options += if index == arr.size - 1
                         "#{link} #{integer}"
                       else
                         integer + separator
                       end
  end
  integer_options
end

def tiny_joinor(arr)
  arr.size == 2 ? "#{arr[0]} or #{arr[1]}" : arr[0].to_s
end

# p joinor([1, 2]) == "1 or 2"
# p joinor([1, 2, 3]) == "1, 2, or 3"
# p joinor([1, 2, 3], '; ') == "1; 2; or 3"
# p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"


def detect_grand_winner(wins)
  wins.key(5)
end

wins = {
  'Player' => 5,
  'Computer' => 0
}

# p detect_grand_winner(wins)
