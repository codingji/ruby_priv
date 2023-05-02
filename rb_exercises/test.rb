def sum_of_sums(array)
  array.map.with_index do |int, index|
    array[0..index].sum
  end.sum

end

def sum_of_sums(numbers)
  cumulative_pile_of_piles = 0 # running_total
  current_pile_size = 0 # sum from adding each value within the 

  numbers.each do |current_number| 
    # `num` is the value (not the index) so 3, 5 and 2

    current_pile_size += current_number
    # for every value, accumulator = accumulator + current value (`num`)
    

    cumulative_pile_of_piles += current_pile_size
    # 
  end

  sum_total
end

1. 
  accum: 0 + 3 => 3
  sum_t: 0 + 3 => 3
2.
  accum: 3 + 5 => 8
  sum_t:3 + 8 => 11
3.
  accum: 8 + 2 => 10
  sum_t:11 + 10 => 21

So basically the 'accumulator' is just adding the current index to the ones that came before it while the sum_total is adding those 'mini-sums' together.

In the test cases, the accumulator is doing whats in the parenthesis and then those parenthetical sums are being added to the total sum upon each iteration.

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35