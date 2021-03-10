# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

sorted_arr


############

# How would you order this array of hashes based on the year of publication of each book, 
# from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end


############

# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].keys[0]


############

# For each of these collection objects where the value 3 occurs, demonstrate how 
# you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
# p arr1
arr2[2] = 4
# p arr2
hsh1[:first][2][0] = 4
# p hsh1
hsh2[['a']][:a][2] = 4
# p hsh2


###########

# Given this nested Hash figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age_total = 0

munsters.each_value do |info|
  age_total += info['age'] if info['gender'] == 'male'
end

age_total


############

# Given this previously seen family hash, print out the name, age and gender 
# of each family member like this: 

# (Name) is a (age)-year-old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  "#{name} is a #{info['age']}-year-old #{info['gender']}."
end


###########

# Given this code, what would be the final values of a and b? 
# Try to work this out without running the code. 

a = 2
b = [5, 8]
arr = [a, b]
# arr = [2, [5, 8]]

arr[0] += 2
# arr => [4, [5, 8]]
arr

arr[1][0] -= a
arr
# arr => [4, [3, 8]]


###########

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']
}

vowels = []

hsh.each do |_, element|
  element.each do |item|
    vowels.push(item.scan(/[aeiou]/))
  end
end

# vowels.flatten.each { |char| puts char }


###########

# Given this data structure, return a new array of the same structure but with 
# the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arrays = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

sorted_arrays


############

# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}

  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end

  incremented_hash
end


#############

# Given the following data structure use a combination of methods, including either 
# the select or reject method, to return a new array identical in structure to the 
# original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

mult_of_three_arr = arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end

mult_of_three_arr


#############

# Given the following data structure, and without using the Array#to_h method, write 
# some code that will return a hash where the key is the first item in each sub array 
# and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}