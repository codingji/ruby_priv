def factors(number)
  return [] if number <= 0
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  # factors
end

p factors(0)
p factors(-12)

p factors(7)
p factors(101)
