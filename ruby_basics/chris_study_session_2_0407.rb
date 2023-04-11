=begin
# name = 'Sarah'
  
# if name
#   puts "Hi #{name}."
# else
#   puts "Nobody's there."
# end

^ Truthiness

# Describe:
# `name` is treated as a condition

# Concept:
# Truthiness of Ruby objects
# String interpolation
# Conditional

# What is considered truthy?
# everything apart from `nil` and `false`
=end

# ==============================================================

=begin
w = "red" # 60
x = "green" # 80
y = x # 80
z = w # 60

w = y # 80
x = z # 60
y = y # 80
z = x # 60
  
p w, x, y, z # => 

'green'
'red'
'green'
'red'

# Lines 1-4 are Initialization
# Lines 6-10 are Reassignment

# ^^ Variables as Pointers
=end

# ==============================================================

=begin
greeting = 'hello'

loop do # Creates an inner scope
  greeting = 'Howdy'
  farewell = 'Goodbye'
  p greeting # What will this line output?
  p farewell # What will this line output?
  break
end

p greeting
p farewell

# Concept: 
# Local Variable Scope with respect to blocks

# Explain Rule:
# Can access variables in higher level scopes.
# Main scope cannot access variables initialized in lower-level scopes.
# Description Notes:
# "On `line 6` we are invoking the `p` method and passing in the object referenced by 'greeting'."
=end

# ==============================================================

=begin
a = "Bob"
b = "Sally"

5.time do |a|
  a = "Jim"
  b = "Sarah"
end

p a
p b

# Concept: ^ Variable Shadowing
=end


=begin
def a_method(number)
  number = 7
end

a = 5
a_method(a)
p a


# ^ Local Variable Scoping with respect to method definition
# Shadowing does not occur with methods.
=end

# ==============================================================

=begin
def a_method(string)
  string << 'world'
end

a = 'hello'
a_method(a)
p a

# Acting like pass-by-reference
  # Mutating Method vs Non-mutating Method

def a_method(string)
  string + 'world'
end

a = 'hello'
a_method(a)
p a

# Acting as if Pass-by-value
  # Touch on mutability briefly, but not main concept.
=end