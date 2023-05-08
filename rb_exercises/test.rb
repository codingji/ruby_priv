require 'pry'

numbers = [1, 2, 3, 4]

# p(
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# )


p(
  numbers.each do |number|
    binding.pry
    p number
    numbers.pop(1)
  end
)