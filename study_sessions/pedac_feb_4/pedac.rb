# Implement a function that calculates the sum of the integers inside a string. E.g. "L12aun3ch Sch3oo45l"
# Note: only positive integers will be tested.

# -method will take in a string as an argument. 
#   -split string into array of by character type
#   -remove any any empty strings from the array
#   -convert strings to integers
#   -add intergers together

#   -return sum
# end



def sum_of_integers(str)
  sum = 0

  str_arr = str.split(/\D/)
  str_arr_of_nums = str_arr.select { |each| each.length > 0 }
  str_arr_of_nums.each { |num| sum += num.to_i }

  sum
end


p sum_of_integers('h3110 w0r1d') == 3111
p sum_of_integers('no integers') == 0
p sum_of_integers('s0m3m0r31nt3g3rs') == 40 
p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD") == 0
p sum_of_integers("HELLO WORLD55") == 55
