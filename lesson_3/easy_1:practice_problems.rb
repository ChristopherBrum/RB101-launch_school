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



