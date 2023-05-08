track the robot part 2#

# P:
# write a method that takes an unknown number of integers representing movements. the method should start at coordinates 0, 0 return an array of the final coordinates

# rules: 
# -unknown number of input integers
# -for every integer, direction changes by 90 degrees clockwise
# -if there is no input or input is 0, return starting coordinates
# -first movement is north
# -input integers can be negative (indicates reverse direction)

# Examples
# trackRobot(20, 30, 10, 40) ➞ [-10, 10]

# trackRobot() ➞ [0, 0]
# // No movement means the robot stays at (0, 0).

# trackRobot(-10, 20, 10) ➞ [20, -20]
# // The amount to move can be negative.
# Notes
# Each movement is an integer (whole number).

# D: 
# -input: integers (unknown amount)
# -return: array (holding 2 integers)

# -2 variables to track n/s and e/w count

# A: 
# -initiaize starting_coordinates to array [0, 0]
# - return starting_coordinates if input is 0
# -initialize north-south count to 0
# -initialize east-west count to 0

# -place input integers into an array (directions)
# -iterate over directions
#   -if index is even
#     -if index + 2 is divisible by 4, subtract current element from north_south 
#     else
#     increment north_south by current element
#   -else (index is odd)
#       -if index + 1 is divisible by 4
#         -decrement east_west by current element
#       -else
#         -increment by east_west by current element
# -place 2 count variables into array and return
# =end
# def trackRobot(*directions)
#   starting_coordinates = [0, 0]
#   return starting_coordinates if directions == 0 #|| directions == []

#   north_south = 0
#   east_west = 0

#   directions.each_with_index do |direction, index|
#     if index.even?
#      (index + 2) % 4 == 0 ? north_south -= direction : north_south += direction
#     else
#      (index + 1) % 4 == 0 ? east_west -= direction : east_west += direction
#     end

#   end
#   [east_west, north_south]

# end


#================================================

 '%.2f' % (0...n).sum { |i| 1.0 / (i * 3 + 1) }