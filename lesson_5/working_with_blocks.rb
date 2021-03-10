[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# => 1
# => 3
# #map returns [1, 3]
=begin

LINE: 1
ACTION: The #map method is being called on the multidimensional array [[1, 2], [3, 4]] and iterating though the array.
OBJECT: The outer array
SIDE EFFECT: None
RETURN VALUE: A new array [1, 3]
IS RETURN VALUE USED?: No

LINE: 1-4
ACTION: The method invocation block is being executed.
OBJECT: Each sub-array
SIDE EFFECT: none
RETURN VALUE: the return value will be 1 for the first iteration and 3 on the second iteration. These are the elements at index 0 of each sub array
IS RETURN VALUE USED?: Yes, the return value is used by the #map method to transform the calling array.

LINE: 2
ACTION: #first method execution
OBJECT: each sub-array
SIDE EFFECT: none
RETURN VALUE: the element at index 0 of the sub-array
IS RETURN VALUE USED?: yes, by the #puts method

LINE: 2
ACTION: the #puts method invocation
OBJECT: the element at index 0 of the sub-array
SIDE EFFECT: Outputs a string representation of an integer
RETURN VALUE: nil
IS RETURN VALUE USED?: no

LINE: 3 
ACTION: the #first method invocation
OBJECT: each sub-array
SIDE EFFECT: none
RETURN VALUE: the element at index 0 of the sub-array
IS RETURN VALUE USED?: yes, its the return value of the block so the #map method will use this value to transform the multidimensional array.\
=end

###############

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
    # => 18
    # => 12
  end
  # returns [18, 7]
  # returns [3, 12]
end
# returns => [[18, 7], [3, 12]]

=begin
LINE: 1
ACTION: assignment
OBJECT: n/a
SIDE EFFECT: none
RETURN VALUE: [[18, 7], [3, 12]]
IS RETURN VALUE USED?: no

LINE: 1 
ACTION: #each method invocation on the multidimensional array 
OBJECT: multidimensional array [[18, 7], [3, 12]]
SIDE EFFECT: none
RETURN VALUE: the calling object [[18, 7], [3, 12]]
IS RETURN VALUE USED?: yes, it is assigned to the variable 'my_arr'

LINE: 1-7
ACTION: outer block execution
OBJECT: each sub-array
SIDE EFFECT: none
RETURN VALUE: [18, 7] and [3, 12]
IS RETURN VALUE USED?: no

LINE: 2
ACTION: #each method invocation
OBJECT: each sub-arrauy
SIDE EFFECT: none
RETURN VALUE: each current sub-array in the iteration
IS RETURN VALUE USED?: yes, to determine return value of out block

LINE: 2-6
ACTION: #each method block execution of inner block
OBJECT: each element for each sub-array of parent array
SIDE EFFECT: none
RETURN VALUE: nil, nil, nil, nil
IS RETURN VALUE USED?: no

LINE: 3 
ACTION: comparison
OBJECT: element of the sub array in current iteration
SIDE EFFECT: none
RETURN VALUE: boolean
IS RETURN VALUE USED?: yes, to determine if the if block is executed

LINE: 3-5
ACTION: conditional if/else statement
OBJECT: each element from each sub-array
SIDE EFFECT: none
RETURN VALUE: if condition is not met will return nil, if condition is met will return the value of the code executed.
IS RETURN VALUE USED?: yes, used to determine the return value of the inner block

LINE: 4
ACTION: #puts method invocation
OBJECT: each number that met the condition of the if statement
SIDE EFFECT: will output a string version of the number that passes a condition
RETURN VALUE: nil
IS RETURN VALUE USED?: yes, used to determine the return value of the conditional statement if met. 
=end



################

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
    # returns num doubled
  end
  # returns => [2, 4]
  # returns => [6, 8]
end
# returns => [[2, 4], [6, 8]]

=begin

LINE: 1
ACTION: #map method call
OBJECT: multidensional array [[1, 2], [3, 4]]
SIDE EFFECT: none
RETURN VALUE: new transformed array [[2, 4], [6, 8]]
IS RETURN VALUE USED?: no
 
LINE: 1-5
ACTION: outer method block execution
OBJECT: each sub-array
SIDE EFFECT: none
RETURN VALUE: transformed sub-array, [2, 4] & [6, 8]
IS RETURN VALUE USED?: yes, returned value from block will be used in new array returned by outer block

LINE: 2
ACTION: #map method call
OBJECT: each sub-array 
SIDE EFFECT: none
RETURN VALUE: a new sub-array with the elements within transformed; [2, 4] & [6, 8] 
IS RETURN VALUE USED?: yes, to determine the return value of the outer block

LINE: 2-4
ACTION: inner block execution
OBJECT: element from each sub-array in the iteration
SIDE EFFECT: none
RETURN VALUE: transformation of each element in each sub-array; 2, 4, 6, 8
IS RETURN VALUE USED?: yes, used by inner block for transformation

LINE: 3
ACTION: multiplication operation/* method call
OBJECT: each element of each sub-array
SIDE EFFECT: none
RETURN VALUE: integer result of multiplying an element of a sub-array by 2
IS RETURN VALUE USED?: yes, to determine the return value of the inner block

=end



################

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
    # first hash 
      # returns => true
      # returns => false
    #second iteration
      # returns => true
  end
  # returns => false
  # returns => true
end
# returns => [{ c: 'cat' }]

=begin

LINE: 1
ACTION: #select method call
OBJECT: array of hashes [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]
SIDE EFFECT: none
RETURN VALUE: [{ c: 'cat' }]
IS RETURN VALUE USED?: no

LINE: 1-5
ACTION: outer block execution
OBJECT: each hash within the parent array
SIDE EFFECT: none
RETURN VALUE: boolean; false & true
IS RETURN VALUE USED?: yes, to determine which elements of the parent array will be in the new transformed array

LINE: 2
ACTION: #all? method call
OBJECT: each hash within the parent array
SIDE EFFECT: none
RETURN VALUE: boolean value; false & true
IS RETURN VALUE USED?: yes, to determine the return value iof the outer block

LINE: 2-4
ACTION: inner block execution
OBJECT: each key/value pair within each hash
SIDE EFFECT: none
RETURN VALUE: boolean; false & true
IS RETURN VALUE USED?: yes, to determine the methods return value

LINE: 3
ACTION: #== method call
OBJECT: the first character of each value and the key converted to a string
SIDE EFFECT: none
RETURN VALUE: boolean; true, false, true
IS RETURN VALUE USED?: yes, to determine the return value of the inner block

=end



