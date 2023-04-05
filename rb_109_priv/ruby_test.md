Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

> This code snippet demonstrates the concept of variable scope with respect to blocks.

  On line 7 within the `do..end` block, the local variable `greeting` is being reassigned (not initialized) since block scope is able to look 'up' into higher level scopes. The local variable greeting from line 1 is therefore the variable being reassigned to the new string object `'Hi'`.

### What does this code print and why?

```ruby
def replace(str, value)
  loop do
    break
  end
  str = value
end

greet = 'Hey!'
replace(greet, 'Hello')
puts greet
```

> On line 28 greet is initialized and assigned to the string object `'Hey!'`.

  Next the `replace` method is invoked and passed the object referenced by `greet` and the string object `'Hello'` as arguments.

  Within the method definition, the method parameter is assigned to the same string object `'Hey!'` referenced by `greet`. `value` is assigned to point to the string literal `'Hello'`.

  On the final line, the method local variable `str` is reassigned to point to a the string object referenced by value which is `'Hello'`. This will result the the return value of the method being `'Hello'`.
  
  Since reassignment has taken place on this line, (and not a destructive method) the value referenced by greet will remain unchanged and when the `puts` method is called and passed `greet` as an argument, the output will be `Hey!`

