require 'pry-byebug'

def fizzbuzz(start_num, end_num)
  fizzbuzz_arr = []
  (start_num..end_num).each do |num|
    binding.pry
    case
    when (num % 3 + num % 5) == 0 then fizzbuzz_arr << 'FizzBuzz' 
    when num % 3 == 0             then fizzbuzz_arr << 'Fizz'
    when num % 5 == 0             then fizzbuzz_arr << 'Buzz' 
    else                               fizzbuzz_arr << num
    end
  end
  display_fizzbuzz(fizzbuzz_arr)
end

def display_fizzbuzz(array)
  array.each do |element|
    puts element
    puts ' '
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
