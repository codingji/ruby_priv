# 1 Sum of Sums

N:
Input: Array object w/ at least one integer
Output: single integer
Req:
1. Input will always be an array with at least 1 number
?: 
1. Will negative/zero/repeating/float vs. int elements create any weird problems?
Probs:
1. create incrementally longer sub-arrays
  - create a starting and ending point for the subarrays and have that range increase by one index each time until the entire array is included
    - counters and loops OR each
    - slice
    - element reference
2. sum them all (either at the end or on a rolling basis)
  - map the sum onto the original array and then take the sum of the new array
  - get the sum on each iteration and add it to a variable outside the iterator
```ruby


def sum_of_sums(array)
  array.map.with_index do |int, index|
    array[0..index].sum
  end.sum

end

def sum_of_sums(numbers)
  cumulative_sum = 0 # running_total
  snapshot_sum = 0 # sum from adding each value within the 

  numbers.each do |current_number| 
    # `num` is the value (not the index) so 3, 5 and 2

    snapshot_sum += current_number
    # for every value, accumulator = accumulator + current value (`num`)
    

    cumulative_sum += snapshot_sum

  end

  cumulative_sum
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

So `accumulator` is keeping track of the running total of adding each subsequent `number` one at a time. That 'snapshot sum' is noted by the `sum_total` variable who is adding those individual sums together to create a cumulative total of each 'snapshot sum'.

In the test cases, the accumulator is basically doing whats within the parenthesis and then those parenthetical sums are being added to the total sum upon each iteration.

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35

```

```