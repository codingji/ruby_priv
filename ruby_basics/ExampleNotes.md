# Pass-by-value

```ruby
a = 5
p a.object_id # some number

#### Immutable Objects
a = a * 3 # => 15
p a
p a.object_id # some number different than line 2
b = 15
p b.object_id

a = 'string'
b = 'string'
p a.object_id, b.object_id

##### Mutable Objects
a = 'string'

b = a + a
p b # => 'stringstring'
p a # => 'string'

b = a << a # Mutating concatenation
p b # => 'stringstring'
p a # => 'stringstring'

```

# Pass-by-reference
```ruby
a = 'string'
b = a
p a.object_id

# Non-mutating methods do not create pass-by-reference behavior
p (a + 'strong')#.object_id
p a.object_id
p a

# Mutating methods demonstrate that Ruby has passed a reference to an object, and not a copy of that object.
p a << 'strong'
p a.object_id
p a
p b
p [a.object_id, b.object_id]

```

# Variable Shadowing
```ruby
num = 3

p(
  num.times do |num| # Change this param name to fix shadowing effect.
    p num
    num = 'cat'
    p num
  end
)

p num
```

# Variables as Pointers
```ruby

a = 5
b = a
p [a.object_id, b.object_id]

b = 6
p [a.object_id, b.object_id]

c = 'string'
d = c
p [c.object_id, d.object_id]
# Mutations in one object are reflected in other aliases for that location in memory:
c << 'th'
p d

c = 'string'
p [c.object_id, d.object_id]

```

# Mutability
### IMMUTABLE: `nil`, boolean objects, numbers (integers, floats)
  - Cannot be mutated. Variables will be reassigned to the new object that represents the evaluated value of the expression.
```ruby
  num = 5 
  p num.object_id # => object_id == 11

  p num * 3 # (num*3) --> object_id 31
  p num.object_id # => object_id == 11

  p num = num * 3
  p num.object_id # => object_id == 31
```

### MUTABLE: String, Array, Hash
  -  Object_id doesn't change when object is 'mutated'
    -  You can change elements of an array or hash, without changing the actual location in memory where the array or hash is located.
    -  String you can add, remove, replace characters without changing the object_id of the original object.

```ruby
  c = 'string'
  c << 'song'
  p c

  arr = ['a', 'b', 'c']
  p arr.object_id

  arr[1] = 1
  p arr.object_id
  p arr

  hash = {a: 'cat', b: 'dog', c: 'bird'}
  p hash.object_id

  hash[:b] = 'chair'
  p hash
  p hash.object_id

```

