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
  for index in array
    p array[0..integer]
  end


end

```