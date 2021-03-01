def integer_to_string(num)
  result = []
  loop do
    rem = num.divmod(10)[1]
    num = num.divmod(10)[0]
    result << rem
    break if num == 0
  end
  result.reverse.join
end

#Solution Using hash  
def integer_to_string(num)
  h = (0..9).zip('0'..'9').to_h
  result = ''
  loop do 
    rem = num.divmod(10)[1]    
    num = num.divmod(10)[0]
     result << h.fetch(rem)
    break if num == 0
  end
  result.reverse
end

###########
def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end


#############
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end