# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers

# # Will print out [1,2,2,3] because #uniq does not mutate the caller


# what is != and where should you use it?
#   This is equivilant to saying is not equal to
#   Use this when when trying to evaluate when 
#   something is not equal to something else 
# put ! before something, like !user_name
#   this instance converts the variable or value prepended with 
# put ! after something, like words.uniq!
# put ? before something
# put ? after something
# put !! before something, like !!user_name


# Programmatically determine if 42 lies between 10 and 100.
# p (11...100).to_a.include?(42)
# OR
# P (10..100).cover?(42)

# show two different ways to put the expected "Four score and " in front of it.
# famous_words = "seven years ago..."

# puts "Four score and " + famous_words
# puts "Four score and #{famous_words}"
# puts famous_words.prepend("Four score and ")
# puts "Four score and " << famous_words


# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# Make this into an un-nested array.

# p flintstones.flatten!


# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number

# p flintstones.assoc("Barney")


# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# In this hash of people and their age, see if "Spot" is present.

# p ages.any? { |k, v| k == "Spot" }
# p ages.has_key?("Spot")
# p ages.include?("Spot")
# p ages.key?("Spot")


# munsters_description = "The Munsters are creepy in a good way."

# p munsters_description.swapcase!
# p munsters_description.capitalize!
# p munsters_description.downcase!
# p munsters_description.upcase!


# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# #add ages for Marilyn and Spot to the existing hash

# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# p ages.merge!(additional_ages)


# See if the name "Dino" appears in the string below:
# advice = "Few things in life are as important as house training your pet dinosaur."

# p advice.match?('Dino')
# p advice.include?('Dino')


# Show an easier way to write this array:

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones


# How can we add the family pet "Dino" to our usual array:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.push("Dino")
# flintstones << "Dino"
# p flintstones


# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# How can we add multiple items to our array? (Dino and Hoppy)

# p flintstones.push("Dino", "Hoppy")
# p flintstones.concat(%w(Dino Hoppy))


# advice = "Few things in life are as important as house training your pet dinosaur."

# # remove everything starting from "house".
# advice.slice!(0..advice.index('house')
# puts advice



# str = "The Flintstones Rock!"
# # For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

# 10.times do |i|
#   print ' ' * i
#   1.times do 
#     puts str
#   end
# end

# # OR

# 10.times { |i| puts (' ' * i) + str }



# # puts "the value of 40 + 2 is " + (40 + 2)
# # Why is there an error and what are two possible ways to fix this?

# # The error is because there is no implicit conversion from integer to string. 

# puts "the value of 40 + 2 is " + (40 + 2).to_s
# puts "the value of 40 + 2 is " + String(40 + 2)
# puts "the value of 40 + 2 is #{(40 + 2)}"



# def factors(number)
#   divisor = number
#   factors = []
#   if number <= 0
#     factors = "Positive integers only, please."
#   else
#     while divisor > 0 do
#       factors << number / divisor if number % divisor == 0
#       divisor -= 1
#     end
#   end
#   factors
# end


# p factors(11)

# # What is the purpose of the number % divisor == 0 ?
# # This is checking to see if the divisor is a factor of the number. 
# If this expression evaluates to true then the number is divided by 
# the divisor with no remainder.

# What is the purpose of the second-to-last line (line 8) in the 
# method (the factors before the method's end)?
# This returns the array of factors of the number parameter. Or a 
# string telling you to only enter positive integers.



# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size > max_buffer_size
#   buffer
# end

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element]
#   buffer.shift if buffer.size > max_buffer_size
#   buffer
# end

# # These methods differ because the first method uses the << operator 
# # which mutates the object variable being passed into the method as an 
# # argument and the second method uses reassignment which points the 
# # object variable within the method to a new object.



# limit = 15

# def fib(first_num, second_num, limit)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1, limit)
# puts "result is #{result}"


