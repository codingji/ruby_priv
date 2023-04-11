# x = 10

trees = ['PINE', 'birch', 'MAple', 'fIR', 'cEdaR']
  
trees = trees.each { |tree| tree.downcase! }
p trees

trees = trees.map { |tree| tree.capitalize }
p trees

# (1..x).each do |i|
#   x = 10
#   puts x - i
# end

