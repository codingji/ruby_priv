

def multisum(integer)
  # Find multiples of 3\
  running_total = 0
  iteration = 1
  multiples_3 = []
  loop do
    running_total += 3
    break if running_total > integer
    multiples_3 << (iteration * 3) 
    iteration += 1
  end

  iteration = 1
  running_total = 0

  # Find multiples of 5
  multiples_5 = []
  loop do
    running_total += 5
    break if running_total > integer
    multiples_5 << (iteration * 5)
    iteration += 1
  end

  # Sum the multiples and return.
  multiples_3
  multiples_5
  multiples_3.union(multiples_5).sum
end


p multisum(3)
p multisum(5)
p multisum(10)
p multisum(1000)