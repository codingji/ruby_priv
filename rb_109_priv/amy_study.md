```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```
Variable scoping ^^

-----
```ruby
a = [1, 2, 3, 3]
b = a # Variables as pointers

c = a.uniq # 
# OR
c = a.uniq!
```
Pass by reference/value && mutability ^^

Concepts:
Local Variable Scope
Variable Shadowing

Setter method

# What will line 22 return and what concept is this demonstrating?

```ruby
def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end
```





p short_long_short('abc', 'defgh')