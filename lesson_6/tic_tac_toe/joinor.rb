=begin
Currently, we're using the Array#join method, which can only insert 
a delimiter between the array elements, and isn't smart enough to 
display a joining word for the last element.

Write a method called joinor that will produce the following result:
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

Algorithm:
  -

=end

def joinor(arr, delimiter=', ', joining_word='or')
  case arr.length
  when 1 then "#{arr[0]}"
  when 2 then "#{arr[0]} #{joining_word} #{arr[1]}"
  else 
    last = arr.pop
    "#{arr.join(delimiter)}#{delimiter}#{joining_word} #{last}"
  end
end

p joinor([1, 2])                 == "1 or 2"
p joinor([1, 2, 3])              == "1, 2, or 3"
p joinor([1, 2, 3], '; ')        == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"