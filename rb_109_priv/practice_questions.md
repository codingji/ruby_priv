### Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

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

# SPOT Wiki ?'s

Return/Output/Why/Concept

## 1 Time 710

```ruby
a = “Hello”
b = a
a = “Goodbye”

puts a
puts b
```

On `line 5` we invoke the `puts` method and pass it the object referenced by local variable `a`. 

On `line 1` local variable `a` is initialized and assigned to the string object `"Hello"`.

On `line 2` local variable `b` is initialized and assigned to reference the same object as `a`. Both `a` and `b` now refer to the same object in memory.

On `line 3` local variable `a` is reassigned to point to the string object `"Goodbye"`. When this reference is passed to the `puts` method on `line 5` the output will be `Goodbye`.

On `line 2` local variable `b` is still pointing to the original object `"Hello"` that was originally shared with `a`. Even though `a` has been reassigned, `b` still points to this original object and will therefore output `Hello` when passed to the `puts` method as an argument on `line 7`.

Both method invocations will return `nil` since the `puts` method always returns `nil`.

This snippet demonstrates the concept of variables as pointers in addition to scoping rules. The reference was passed, and also a variable `a` was made to point to a different object during reassignment.

## 2. Time 800

```ruby
a = 4

loop do  
  a = 5  
  b = 3

  break
end

puts a
puts b
```

The `puts` invocation on `Line 10` will output `5` and return `nil`.

The `puts` call on `line 11` will output NameError and therefore not return anything.

This is due to the concept of variable scoping rules in Ruby.

On `line 1` the local variable `a` is initialized and assigned to the integer object `4`.

On `line 4`, a `do..end` block is passed in as an argument to the loop method. The creation of this block creates a new inner scope. Block scopes are able to access variables in higher level scopes, so when variable `a` is referenced on `line 4`, we are referring to, and reassigning the outer scope's variable `a` from `line 1` to point to a new integer object `5`. This is the object reference passed to the `puts` method invocation on `line 10` and why this will output `5` (and return `nil`.)

On `line 11` when `puts` is invoked and passed the object referenced by `b` as an argument, ruby cannot find a local variable `b` to evaluate. This is because the outer/main scope is unable to access variables initialized within inner scopes (like the one created by the `do..end` block. So, this will raise a NameError.


## Concept/Return/Output/Why Time 700

```ruby
a = 4
b = 2

loop do  
  c = 3  
  a = c  
  break
end

puts a
puts b

```

On `line 10` the object referenced by `a` is passed to the `puts` method. To determine the output, we must trace the value of `a` through the code snippet.

On `line 1` local variable `a` is initialized in the main scope and assigned the integer object `4`. Later we see `a` again, this time it is within a `do..end` block that is passed to a loop method. While the `do..end` block creates an inner scope and may declare its own variables, it may also see variables located in higher level scopes (like the main scope in this example). So when we assign `a` to the value of `c` we are atually reassigning the local variable `a` from `line 1` to point to the object referenced by `c`. That object is currently the integer `3` so `a` will now reference `3` as well.

When `a` is passed to the `puts` method on `line 10`, it will output `3` and return `nil` (as all `puts` methods do).

On `line 11` when the local variable `b` is passed to the `puts` method as an argument the output will be `2`. This is because `b` was initialized within the same scope as the `puts` invocation and will return the original value it was initialized with, integer object `2`. Again this will return `nil` since `puts` returns `nil`.

The concept demonstrated here is variable scoping rules for ruby. Block scopes are able to access variables in upper/higher levels. 

The other concept demonstrated here is the concept of variables as pointers. Even though `c` was a variable only accessible to the `do..end` block, the reference to integer object `3` was able to be passed to the local variable `a` as shown upon printing the variable's referenced value to the console.

## 4 CROW Time 623

```ruby
def example(str)
  i = 3  
  loop do    
    puts str    
    i -= 1    
    break if i == 0  
  end
end

example('hello')

```

On `line 10` we invoke the method `example` and pass it the string object `'hello'` as an argument.

Within the method, the method parameter `str` is assigned to the argument passed in, `'hello'`, so now `str` references `'hello'`.

On `line 4` the `puts` method is invoked and passed the value referenced by `str` as the argument. Since `do..end` blocks can access variables in higher/upper level scopes, `str` is accessible to the block and thus outputs `hello` to the console.

On `line 5` the method variable `i` is decremented. This is possible again due to scoping rules for `do..end` blocks which can access variables from upper level scope.

This process will repeat until `i == 0`. This will happen after 3 iterations of the loop have occurred, breaking on the end of the 3rd pass, after `str` has been passed to the `puts` method call.

Therefore, `hello` will be output to the console 3 times before the program terminates.

Again, this is a demonstration of scoping rules in ruby. It also demonstrates variables as pointers and the ability for ruby to pass a reference into a method for that method to manipulate.


## 5 CROW Time 416

```ruby
def greetings(str)  
  puts str  
  puts "Goodbye"
end

word = "Hello"
greetings(word)

```

On `line 6` we initialize a local variable `word` and assign it to the string object `"Hello"`.

On `line 7` we invoke the `greetings` method and pass it the object referenced by `word` as an argument.

Within the method invocation, the method parameter `str` is assigned to the same string object as `word`. Passing this object as an argument to the `puts` method on `line 2` produces the output `Hello` and returns `nil`.

On `line 3` the puts method is passed the string literal `"Goodbye"` as an argument. This will output `Goodbye` and return `nil`.

This is an example of variables as pointers as well as scoping rules. The `greetings` method is able to access and manipulate the object referenced outside of its scope because the pointer is passed in as an argument via a parameter created during the method's definition.

## 6 CROW TIME 12
```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do  
  sum += arr[counter]  
  counter += 1  
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

There are a number of things going on in this example. There are scoping rules and variables as pointer concepts demonstrated.

On `line 11`, the string literal (with an interpolated variable `sum`) is passed as an argument to the `puts` method.

To determine the output of this method call, we have to look back into the looping mechanism. A flyover view shows us that `sum`, `counter`, and `arr` are all initialized within the main scope. Due to scoping rules in ruby, this gives the `do..end` block (passed to the loop method) access to all these variables as well.

This looping method will iterate until the counter has reached the same value as the length of the array object referenced by `arr`.

On `line 6`, `sum` is re-assigned to the current value of `sum` (`0`), plus the value of the array object at the index that corresponds to the value of counter, `0`. The value at `arr[0]` is `1` and so the new value of `sum` is `0 + 1`, or `1`. The counter is incremented by `1` and the break condition evaluates to `false`, so the loop iterates again.

This pattern continues until the value of counter has reached the equivalent of `arr.size` which is `4`. At this point, `0` + `1` + `2` + `3` + `4` has been added to `sum` which now carries the value of `10`. 

On `line 11` when the `puts` method is invoked with the interpolated value of `sum`, the method call will produce the output:

=> Your total is 10

Because `do..end` blocks are able to see variables initialized in outer scopes, the block is able to manipulate variables from the outerscope and have those changes carry over to each new iteration.

Furthermore, the ability to pass a reference to an object allows ruby to manipulate the associations to those variables from within different scopes from where they are intialized. In this specific example, due to the immutability of integers, ruby is behaving more as a pass by value language since the integers themselves are at fixed locations in memory. The variable pointers are therefore redirected, rather than the object itself changing.

## 7. Time:

```ruby
a = 'Bob'

5.times do |x|  
  a = 'Bill'
end

p a

```

There is one output from this code snippet from the `p` method invocation on `line 7`. The `p` method will both output the result and return the value of the result. In this case the output will be `"Bill"` and the return value will be `"Bill"`.

The reason the output is `"Bill"` and not `"Bob"` is due to variable scoping rules as well as the concept of passing references in Ruby.

The link between `a` is and the string object `'Bob'` is initially established on `line 1`. 

On `line 3` a new scope is created with the passing of a `do..end` block to the `times` method.

Within the `times` method block, the variable `a` is reassigned to the string object `'Bill'` 5 times. This demonstrates the ability of variables to point to objects and for those references to be redirected. This redirection is possible due to scoping rules of the Ruby language. The `do..end` block, has its own scope, but is able to 'look' up and out of its scope to the parent scope within which it was created. Because of this, the local variable `a` initialized on `line 1` is able to be accessed and manipulated within the `do..end` block.

## 8 CROW Time 620

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

Since there are two calls to `puts` in this code, we will discuss twho different outputs here. 

The `puts` invocation on `line 9` is passed the object referenced by `animal` as its argument. This will output `cat` and return `nil`.

The `puts` invocation on `line 10` will be passed the object referenced by a local variable `var` as its argument. This will raise a NameError and terminate the program.

First let's look at the `puts` call on `line 9`. The local variable animal is first initialized on `line 1` and assigned to the string object `"dog"`.

Then on `line 4` within the scope of a `do..end` block passed to the loop method we see the reassignment of this variable to the string object `'cat'`. The reason the `animal` from the main scope is able to be accessed within the scope of the `do..end` block is beacuse of variable scoping rules in Ruby. `do..end` blocks passed to the loop method are able to access variables in the parent scope.

The opposite is not true however. The parent scope is unable to access a child or inner scope created by the `do..end` block. That is why when ruby attempts to evaluate the reference to `var` it is unable to find any local variable with that name and returns the NameError.

## 9 (1 Shadowing) Time 10:00

```ruby
a = 4
b = 22.times do |a|
      a = 5
      puts a
    end

puts a
puts b

```

The following code with output `4` return `nil` from `line 7` call to `puts` and `line 10` call to `puts` will output `22` and return `22`.

To understand the output we need to understand the concept of variable shadowing in Ruby.

For the `line 7` invocation of the `puts` method, we pass in the local variable `a` as an argument. This outputs `4` rather than `5` due to variable shadowing that is established with the setting of the `do..end` block parameter to the same name as the local variable - `a`.
When the block parameter is set to the same name as a local variable in a parent scope, the block's local variable 'shadows' the outer scope's variable. In this way, the variable `a` initialized on `line 1` is inaccessible to the block. So rather than reassignment of the main scope `a`, reassignment of the block scope `a` is occurring on `line 3`. Since the `puts` invocation on `line 4` is passed the block local variable `a`, it outputs the value `5`. The number of iterations is irrelevant to the final value referenced by `a`.

The integer object calling the times method is important however when looking to find the return value of the entire call. If we reference the documentation, we know that the times method will return the value of the calling method, so `22`. In this way, the value of `b` is initialized and assigned to `22`.

When this integer object is passed to the `puts` method as an argument on `line 8` it outptus `22` and returns `nil` since all calls to `puts` return `nil`.

FORGOT TO EXPLAIN THE OUTPUT FROM THE TIMES METHOD:

The `puts` call within the `times` method will output `5`, 22 times before ending the iterative process.

## 10 (2 Shadowing) Time 602

```ruby
n = 101.times do |n|
      n = 11
      end
puts n

```

This method will output `101` and return `nil`.

The reason for this is due to the concept of variable shadowing.\

When inner scopes are created by blocks and the parameters defined for that block match names in the outer scope, the inner scope's local variable will 'shadow' the outer scopes local variable that shares the name. In this example, we can see that the `do..end` block on `line 1` has one parameter named `n`. This effectively make the outer scope `n` inaccessible from within the block. So the `n` referenced on `line 2` is reassignment of the block parameter `n`, not the `n` being initialized and assigned to the return value of the `times` method called by `101`.

The reason `n` references integer object `101` is because the return value of the `times` method is simple the object that called it. So `101` in this case is the return value.

When this return value is passed to the `puts` method invocation as an argument on `line 4`, it is printed to console as `101` and then as `puts` always does, returns `nil`.

## 11 (3 Shadowing) 513

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal

```

The output of the `puts` invocation on `line 8` will output the currently referenced object of the local variable `animal` which is `"dog"`.

At first glance, it might appear that `animal` references the string object `"cat"`. The reason this reassignment did not affect the `animal` initialized on `line 1` is due to the concept of variable shadowing.

If we take note of the block parameter on `line 3` we will see that it shares the same name as the local variable in the main scope.

Due to the rules of the Ruby language, the block will look within its own scope prior to looking outside into upper level scopes. Since it finds an instance of `animal` within its own scope, it has no need to continue searching. So the reassignment taking place on `line 4` is reassigning the block parameter `animal`. 

In this way, the `animal` initialized in the main scope is left unchanged. It is inaccessible from within the `do..end` block due to the variable shadowing taking place.

## 12 (1 Object Passing/Variables As Pointers) Time 437

```ruby
a = "hi there"
b = a
a = "not here"

# What are a and b?
puts a
puts b
```

In this code snippet, `a` is referencing the string object `"not here"`
and local variable `b` is referencing the string object `"hi there"`.

This is due to the concept of variables as pointers and the ability to pass object references in ruby.

On `line 1` local variable `a` is intitalized and assigned to the string object `"hi there"`.

On `line 2` we initialize the local variable `b` and assign it to the same string object as `a`. So at this point both `a` and `b` reference the same string object in memory, `"hi there"`.

On `line 3`, `a` is reassigned to the string object `"not here"`. This reassignment has no bearing on the binding between `b` and the string object `"hi there"` and so `b` remains pointing to that location in memory. 

`a` is reassigned and not mutated since the `=` operator is not a mutating method even though string objects are mutable. Instead a new link between `a` and a new string object `"not here"` is established during the reassignment.

## 13 (2 Variables as pointers/Object passing) 345

```ruby
a = "hi there"
b = a
a << ", Bob"

```

In the following code snippet, `a` and be end up referencing the same mutated string object `"hi there, Bob"`.

The reason for this is due to both the concept of variables as pointers as well as mutability with respect to those values.

On `line 1` local variable `a` is initialized and assigned to the string object `"hi there"`. On `line 2` local variable `b` is initialized and assigned to the object referenced by `a`. At this point both `a` and `b` are pointing to the same string object.

On `line 3` when the shovel operator is invoked and passed the string object `", Bob"` as an argument, the object referenced by both `a` and `b` is mutated because the `<<` operator is a mutating/destructive method.

Now both `a` and `b` reference the same string object `"hi there, Bob"`.

We can see this by outputting both `a` and `b` to the screen.

## 14 (3 Object Passing/Variables As Pointers) 700?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq

# What are a, b, and c? What if the last line was `c = a.uniq!`?

```

In this code snippet `a` will reference the original array object it was initially assigned to, `[1, 2, 3, 3]`.

Local variable `b` will also reference this same string object since the reference to the object is assigned to be on `line 2`.

On `line 3`, local variable `c` is initialized and assigned to the return value of `uniq` called by local variable `a`. This calls `uniq` on the array object `[1, 2, 3, 3]` and returns a new array object `[1, 2, 3]` which contains only the unique values in the array object.

So `c` will reference a new string object, while `a` and `b` will reference the original string object assigned to `a` on `line 1`.

Had the method invoked on `a` been `uniq!` on `line 3`, then the object itself would be mutated since `uniq!` is a destructive/mutating method and string objects are mutatble in Ruby.

At this time, all three variables would point to the same array object `[1, 2, 3]`.

## 15 (4 Object Passing/Variables As Pointers) Time 800

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

# What is `a`? What if we called `map!` instead of `map`?
```

Here after running all lines of code, `a` will still be referencing the array object `['a', 'b', 'c']`.

The reason for this is because a non-destructive method was invoked on the object passed into the `test` method via the parameter `b` established in the method definition. 

Even though the value referenced by `a` is passed to the `test` method parameter `b` on `line 6`, nothing was invoked within the method that would mutate the value of that object. Instead a new mutated version of the object was returned from the `test` method.

The return value from the `test` method will be `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`

Had the method called by local variable `b` been the destructive method `map!` instead, the object referenced by `a` and `b` would have been mutated and they would both reflect the transformation from the `map!` method, pointing to the same array object: `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`.

## 16 (5 Object passing/variables as pointers) 820

```ruby
a = 5.2
b = 7.3
a = b
b += 1.1

# What is `a` and `b`? Why?
```

In this code snippet `a` is `7.3` and `b` is `8.4`. This is due to the concept of variables with pointers with respect to non-mutable objects as well as the 'destructiveness' of a method.

On `line 1` local variable `a` is initialized and assigned the float object `5.2`.

On `line 2` local varable `b` is initialized and assigned tot he float object `7.3`.

On `line 3`, local variable `a` is reassigned to point to the float object referenced by `b`. At this time both `a` and `b` point to the same object in memory.

On `line 4`, `b` is reassigned. This happens because assignment is not a mutating method and neither is the `+` method. No methods can mutate numeric objects anyways as they are not mutable objects unlike other objects in ruby are.

So on `line 4`, whats really happening is `b = b + 1.1`. At this point, the expression on the left is evaluated, and the return value of that expression is assigned to `b`. So `7.3 + 1.1` is `8.4` and therefore now the value of `b`. Since `b` was reassigned and not mutated, `a` still references the integer object `7.3`.

This demonstrates how ruby can appear to act like a pass by value language when dealing with non-mutating objects or methods. It is as if a copy was made of the value referenced by `b` and that value was mutated. We know however that the object was not mutated and in fact the variable `b` was reassigned to the integer `8.4`.

## 17 (6 Variables as pointers/object passing)

```ruby
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)
puts test_str

```

 This code snippet initializes local variable `test_str` on `line 6` and assigns it to the string object `'Written Assessment'`.

 On `line 7` this object reference is passed into the `test` method as an argument.

 Within the method, the method parameter `str` is assigned to the string object referenced by `test_str`. At this point, both `test_str` and `str` point to the same object in memory.

 On `line 2` the method variable `str` is reassigned to the cthe new string object created by adding the existing value of string to the string literal `'!'`. At this point, `str` points to a new string object `"Written Assessment!"`.

 This new object then calls the `downcase!` method and is mutated in place to now be `"written assessment!"`.

 This change took place on the new object created from the previous reassignment however and not the object `str` and `test_str` originally shared. So `test_str` is still left as it was initialized.

 On `line 8` the `puts` method is invoked and passed the local variable `test_str` as an argument and thus, the string object `Written Assessment` is output to the console and, as always, `puts` returns `nil`.

 This demonstrates the concept of passing references as well as mutatative qualities of methods and how that quality affects the object being referenced.

## 18 (7 Object passing/variables as pointers) Time 8:19

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

A flyover view of the code snippet shows we will have two separate outputs to the console. One for local variable `a` and one for `b`.

On `line 5` the local variable `a` is initialized and assigned to the integer object `3`. On `line 6` local variable `b` is initialized and assigned to the return value of the `plus` method when passed the arguments `a`, and `2`.

On the first line of the method definition, the method variables `x` and `y` are initialized to point to the object referenced by `a` (`3`) and the integer object `2` respectively. So at this point, method variable `x` and local variable `a` point to the same integer object, `3`. Method variable `y` points to integer object `2`.

On `line 2`, the method variable `x` is reassigned to the sum of the object it currently references and the integer `2` referenced by `y`.
This reassigns method variable `x` to `5`. Since methods will implicitly return the last evaluated expression, this method will return the integer `5`. This integer will be assigned to the local variable `b` on `line 6`.

On `line 8` the `puts` method is invoked and passed the object referenced by local variable `a` as an argument. Since integer objects are not mutable, and not reassigned, it still references the integer object `3`. On `line 9` when the object referenced by `b` is passed to the `puts` method the output will be the return value of the `plus` method call we discussed earlier, `5`. Both `lines 8 and 9` will return `nil` since `puts` always returns `nil`.

The concept demonstrated is both object passing and the way in which Ruby acts like a pass by value language when working with immutable objects or non-mutating methods.

## 19 (8 variables as pointers/object passing) Time 6:18

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 
puts y
```

A high-level glance at this code shows an assignment, a method call, and an output.

On `line 5`, a local variable named `y` is initialized and assigned to the string literal `'a'`. On `line 6` the `increment` method is invoked and passed the object referenced by `y` as its argument. This sets the method variable `x` to point to the same string object.

When the `<<`(shovel) operator is invoked on the object referenced by `x` and `y`, it mutates the object in place. This mutation is appending the character `'b'` to the string `'a'` resulting in `'ab'`. Because the `<<` operator is a destructive method, the object itself is mutated and the change is reflected in both variables pointing to it. We can see this from the output of the `puts` method called and passed the local variable `y` as its argument.

This will output the string object `'ab'` and return `nil` (as `puts` always does).

This outcome demonstrates the concept of variables as pointers since a change to made from accessing an object via one variable is reflected in all variables pointing or bound to that object. In this way Ruby behaves as a pass by reference language. The reference to the object was passed into the `increment` method, not a copy of the value.

## 20 (9 Object passing/variables as pointers) 800

```ruby
def change_name(name)
  name = 'bob' # does this reassignment change the object outside the method?
end
 
 name = 'jim'
 change_name(name)
 puts name
```

This code snippet starts with an initialization of the local variable `name` and assigns it to the string literal `'jim'`.

On the next line, the `change_name` method is invoked and passed the object referenced by `name` as the argument.

Within the `change_name` method, the method variable `name` is also set to point to the string object `'jim'`. At this point, we have two discrete variables called `name` (one in the main scope and one in the method scope) which are pointing to the same string object in memory.

On `line 2`, the method variable `name` (not the main scope `name`), is reassigned to point to a new string object `'bob'`. This is a new string object because reassignment is not a mutating method. It simply redirects the pointer associated with method variable `name` to a new place in memory. Now the two `name` variables point to two different string objects.

Since this is the only and final line of code evaluated within the `change_name` method call, the method implicitly returns the string object `'bob'`.

On the final line of the code snippet, the `puts` method is invoked and passed the main scope variable `name` as its only argument. Since this main scope `name` has not been mutated by the `change_name` method invocation, nor reassigned anywhere else in the same scope, it still points to the original string object `'jim'` it was initialized with.

So the output will be `jim` and the return value will be `nil` as is always the case with the `puts` method.

This demonstrates the concept of object passing in ruby. In this case the object reference was passed into the method, but since nothing was done to the object itself, it appears to behave like a pass by value language. This is due to the fact that only non-mutating expressions (with respect to main scope `name`) were called within the `change_name` method. So while the return value may appear to be a mutated object, it is in fact an entirely new string object. 

## 21 (10 object passing and variables as pointers) Time 440

```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```

The code snippet begins with initializing a local variable `name` and assigning it the string object `"jim"`.

Then on `line 6` this object is passed to the `cap` method via the variable `name` as an argument.

Within the `cap` method, on `line 1`, the method variable `str` is assigned to point to this same object and so now local variable `name` and method variable `str` both reference the same string object `"jim"`.

When the destructive `capitalize!` method is called by `str`, it mutates the object it references (as opposed to returning a new object). At this point the mutation is reflected in all variables that point to this object. So both `name` and `str` point to the mutated string object `"jim!"`.

So on `line 7` when `name` is passed to the `puts` method, the mutated string will be output: `jim!` and as always, `puts` will return `nil`.

This demonstrates the concept of variables as pointers and how ruby can behave as a pass by referenced language when mutating methods are invoked on the objects referenced. The object itself can be changed which shows that a reference to the object, and not a copy of the object, was passed around.

## 22 (11 variables as pointers/object passing) Time 650
I misread this whole problem.

```ruby
a = [1, 3]
b = [2]
arr = [a, b]

p arr
a[1] = 5
p arr

# What is `arr`? Why? What concept does it demonstrate?

```

In this code snippet, a local variable `a` is initialized and assigned to the array object `[1, 3]` on `line 1`.

On `line 2` a local variable `b` is initialized and assigned to the array object containing one integer object, `[2]`.

On `line 3` the local variable `arr` is initialized and assigned to the array object who's elements are the objects referenced by `a` and `b` respectively.

At this point, `arr[0]` and `a` referenced the same object in memory.
Similarly `arr[1]` and `b` reference the same object in memory.

On `line 5` the `p` method is invoked and passed the object referencd by `a` as its argument. This will print and return the array `[[1, 3], [2]]`.

Then on `line 6`, `a[1]` is reassigned to point to a new object. This object is the integer `5`. So now `a` references `[1, 5]`. Since `arr[0]` points to the object referenced by `a`, any changes made to that object will be reflected in all references to it. So after the reassignment takes place on `line 6` the `arr` object reflects this change and now points to `[[1, 5], [2]]`.

When `arr` is passed to the `p` method on the final line of code it will reflect this change in the value of the reference shared with `a` and the return and output will be the array object `[[1,5],[2]]`.

This demonstrates the concept of variables as pointers and how mutations made to objects are reflected in all variables referencing that object. This shows that ruby can behave as a pass by reference language.

## 23 (12 object passing/variables as pointers) time: 10:00

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2

```

On `line 8` local variable `arr1` is passed to the `puts` method as its sole argument. To determine the output of this call, we will have to follow the object referenced by `arr1` through the code.

On `line 1`, `arr1` is initialized and assigned to the array object `["a", "b", "c"]`.

On `line 2`, `arr2` is initalized and assigned to the return value of the `dup` method called on the object referenecd by `arr1`. The `dup` method creates a 'shallow' copy of the caller. Since the calling array is comprised of basic elements, the objects within the indices are also copies of the strings, not references to the string objects.

So we now have two distinct arrays with no links between them. `arr1` is not an alias for `arr2` and none of their elements are linked either.

When the destructive `map!` method is called by `arr2` we know the method will mutate the object itself (not return a new array).

The `map!` method will transform each element and replace it will the output from the block that is passed to it as an argument. In this case, the `do..end` block with parameter `char` is passed to it.

This block will execute for every element in `arr2`, transforming its value at each index with the output from the block. So each element of `arr2` will have the `upcase` method invoked on it. The result of this expression will be an uppercase version of each character and that version will become the new value for `arr2` at that index.

So after the `map!` method call, the array referenced by `arr2` will be `["A", "B", "C"]`. Because the calling object `arr2` was already a copy, there will be no alteration to the object it is a copy of (`arr1`). `arr1` will still point to the original array object it was initialized with `["a", "b", "c"]`.

On `line 8` when the `puts` method is invoked and passed `arr1` as its argument the output will be each element of the array on its own line, so:
a
b
c

On `line 9` when the `puts` method is invoked and passed `arr2` as its argument, it will similarly output each element one by one and output
A
B
C

Both calls to `puts` will return `nil` since `puts` always returns `nil`.

This demonstrates the concept of both object passing and how when copies are made, ruby can behave as if it is a pass by value language, even when it is passing a reference.

## 24 (1 Object Mutabilty/Mutating Methods) Time 944

```ruby

def fix(value)
  value.upcase!
  value.concat('!')
  value
end

p s = 'hello'
p t = fix(s) # => "HELLO!"
p s          # => "HELLO!"

p "'s' object id: #{s.object_id}" # => "'s' object id: 60"
p "'t' obejct id: #{t.object_id}" # => "'t' obejct id: 60"

# What values do `s` and `t` have? Why?

```

On `line 7` local variable `s` is initialized and assigned the string object `'hello'`.

On `line 8` the local variable `t` is intialized and assigned to the return value of the `fix` method with the object referenced by `s` passed in as its sole argument.

Within the method, the method local variable `value` is assigned to the same object as the argument `s`. So both variables (albeit in different scopes) point to the same place in memory. The reference to the object has been passed.

On `line 2` `upcase!` is called on `value`. Since this is a mutating method, the original object is mutated in place and now both variables point to the mutated string `'HELLO'`.

On `line 3` the `concat('!')` method is called on this same object. Concat is also a mutating method and so the `'!'` is appended to the existing string object, mutating it. Again both variables continue pointing to the newly mutated string `'HELLO!"`.

On the final line of the method, the method variable `value` is evaluated and implicitly returned from the `fix` method. So at this time the method call not only mutates the argument passed to it, but it also returns that mutated object.

In this way, the initialized variable `t` is assigned to this value, however it is assigned to the pointer, not the value itself. So `t` now references the same object as `s`, it simply wasn't pointing to that object until after the `fix` method had implemented changes to `s`.

This demonstrates the concept of variabels as pointers and mutability.
Ruby behaved as a pass by reference language in this example and the mutability of objects allows for this reference passing to be demonstrated because the original object can be changed, even when 'passed' to other variables as arguments in a method call.

## 25 (2 object mutability/mutating methods) 1108

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)

# What values do `s` and `t` have? Why?
```

In this example, we begin my assigning the string object `'hello'` to the initialized variable `s` on `line 6`.

Then on `line 7` we initialize and assign to `t` the return value of the `fix` method with the value referenced by `s` passed to it as an argument.

To determine the object `t` will be assigned to we will have to follow the reference into the `fix` method.

On `line 1` we see the method local variable `value`. The string object referenced by `s` is shared with this method variable `value`. So now `s` and `value` are both pointing to the same object in memory.

On `line 2` the method variable `value` is reassigned to the return value of calling the `upcase` method on the current object referenced by value. Because `upcase` is a non-mutating method, the return value will be a new string object with all letters capitalized. This method call does not change the original object. During this line of code, link shared by `s` and `value` via pointing to the same object in memory is broken. They now point to two different objects.

On `line 3` the `concat('!')` method is called on `value` this mutates the object in place and now `value` points to the updated string object `'HELLO!'` while `s` still points to `'hello'`.

Since this is the last line of code evaluated by the method, this is the value that is returned and assigned to local variable `t`. At this time the method closes, but the variable `value` has passed the pointer to the object that was created within the method scope. `t` now points to this object. 

We can see this by calling `object_id` on the final line of code within `fix` and then on `t` outside the method. They are the same `object_id`.

This snippet demonstrates the concept of variables as pointers as well as mutability in Ruby. Depending on the mutative quality of methods, Ruby can appear to act as pass by value or pass by reference. In this example, it is apparent that both take place. While we end up with a final return value that is a new object, rather than the original object, it appears that ruby has acted as a pass by value language. However within the method itself, the object is mutated in place, demonstrating that objects themselves can be mutated.

## 26 (3 object mutability/mutating methods) Time 11:38

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

p s = 'hello'
p t = fix(s)
p s

# What values do `s` and `t` have? Why?

```

A quick flyover of the snippet shows us a variable initialization and assignment for `s`and then that variable being passed into a method and its return value being assigned to a new variable `t`.

To determine the value of `s` and `t` after the method call we can follow the object referenced by `s` as it is passed into `fix`.

So after initializing and assigning `s` to he string object `'hello'`, we initialized and assign to `t` the return value of the `fix` method when `s` is passed in as its sole argument.

Within the `fix` method definition, we see it has one parameter `value` to which we have assigned the object referenced by local variable `s`. At this time both method variable `value` and local variable `s` point to the same object in memory.

On `line 2`, the `<<` operator is called on `value`. This is a mutating method and therefore mutates the object referenced by `value`. This mutation is reflected in both `s` and `value`. They both reference the object `'helloxyz'`.

Now, on `line 3`, value is reassigned to the return value of calling the `upcase` method on the current object referenced by value (`'helloxyz'`). Because this method is non-mutating, it will assign `value` to a new string object, rather than mutating the caller. 

At this point, `s` and `value` no longer point to the same object. `s` still points to `'helloxyz'` and `value` now points to the new string object `'HELLOXYZ'`. They each have unique `object_id`'s.

On `line 4`, the `concat` method is called on the object currently referenced by `value` and passed in the string literal `'!'` as its sole argument. `concat` is a method that mutates the calling object and so appends the `'!'` character to the end of the existing string, creating `'HELLOXYZ!'`. This mutated object maintains the same object_id it had from the line prior.

Since this is the last line evaluated by Ruby, the method will implicitly return the reference to this object. This object reference will be assigned to local variable `t`.

At this time, `s` will be pointing to the object `'helloxyz'` and `t` will be pointing to `'HELLOXYZ!'`.

This is due to the concept of mutating methods in ruby. Methods that do not mutate the caller return a new mutated version of the calling object and a reference to that new object is bound to the variable. In the case of a mutating method, the object itself is changed and the binding to that object remains the same.


## 27 (4 object mutability/mutating methods) Time 9:59

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)

# What values do `s` and `t` have? Why?
```

In this example, `s` and `t` both point to the same string object `'HELLO!'`.

This is due to the concept of mutating methods in Ruby. The reference to string object `'hello'` is passed into the `fix` method by way of the variable `s` as its sole argument.

Once inside the method, the method variable `value` is assigned to this string object as well. Both `s` and `value` point to the same object in memory.

On `line 2`, `value` is being reassigned to the return value of calling the `upcase!` method on the object referenced by `value`. `upcase!` is a mutating method and therefore mutates the calling object `value`. This mutation is reflected in all variables that reference the object, in this case `s`.

On `line 3` the `concat` method is then called on value and passed in the string literal `'!'` as its argument. `concat` is a mutating method and so mutates the calling object. Again, this change is reflected in all variables that reference this object.

Since this is the final line evaluated by Ruby, the method implicitly returns the reference to this object, which is currently the string object `'HELLO!'`, and assigns the reference to the local variable `t` after its initialization.

At this time both `s` and `t` reference the same object `'HELLO!'`.

This snippet demonstrates the concept of mutability with respect to method choice. Some methods mutate the caller and some do not. In this example, the output from the method is the same object and therefore demonstrates that Ruby is able to pass around the reference to an object since the original object is able to be mutated. Even though re-assignment takes place on `line 2`, the reassignment is to the mutated object, not a new object and so `value` is being reassigned to itself here. In fact, the reassignment is not doing anything in this program and could be changed to simply `value.upcase!`.

## 28 (5 object mutability/mutating methods) Time 750

```ruby
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)

# What values do `s` and `t` have? Why?
```

On `line 6` the local variable `s` is initialized and assigned to the string object `'abc'`. Then on `line 7` this object is passed into the `fix` method as an argument. The return value of this call is assigned to the initialized local variable `t`.

Within the method, method local variable `value` is passed the reference to the string object referenecd by `s`. They both now point to the same object in memory.

On `line 2`, element assignment is used to change the character located at index 1 of the string `'abc'`. This is a mutating method and therefore changes the string referenced by both `s` and `value` to `'axc'`. Then on `line 3` the current object reference is returned from the method using implicit return from the last evaluated line of code which is simply the variable `value`.

This reference is returned from the method and `t` is then assigned to this reference. 

Due to the fact that mutating methods were used within the `fix` method, the reference output my the method is pointing to the same object as local variable `s`. So `s` and `t` both point to the same string object `'axc'`.

This is due to the concept of mutability and mutating methods in Ruby.
Mutating methods augment the calling object, (leaving existing references unchanged) rather than create a new mutated copy and pointing to that new object.

The ability to mutate objects in place shows that Ruby can pass references around to and from different scopes.

## 29 (6 object mutability/mutating methods) Time 731
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

On `line 5` the local variable `a` is initialized and assigned to the string object `'hello'`.

On `line 6`, `a_method` is invoked and passed the object referenced by `a` as an argument.

Within the method definition we see it has one parameter `string`. So the method local variable `string` is assigned to the same object as local variable `a`. 

The `<<` method is called on the object referenced by `string` and passed in the string object `' world'` as its argument. This mutates the object and the mutation is reflected for all aliases of this object reference. So both `string` and `a` reference the string object `'hello world'`. Since this is the last line evaluated in the `a_method` method, it will be implicitly returned from the method.

On `line 8`, the `p` method is invoked and passed the local variable `a` as its argument.

This will output the string object `"hello world"` as well as return the same string object `"hello world"`.

This demonstrates the concept of mutability and mutating qualities of methods in Ruby. Mutable objects can be mutated or not depending on the mutative qualities of the methods being called on the object. In this case, a mutating method was called on `string` and so Ruby appears to act as a pass by reference language here. In the circumstance where a non-mutating method has been invoked inside the method `a_method`, the object_id coming out of the method could have been a new one and made Ruby to appear to be acting as a pass by value language.

This demonstrates that Ruby behaves as if it is a pass by reference or pass by value language depending both on the mutability of calling objects, or the mutative quality of the methods being called on those objects.

## 30 (7 object mutability/mutating methods) ???

```ruby
arr

num = 3
num = 2 * num

```

## 31 (8 object mutability/mutating methods) Time 5:44 then 7:42

```ruby
a = %w(a b c)
a[1] = '-'

p a

# What is the return/output and why/concept?

```

On `line 1` the local variable `a` is initalized and assigned to the array object `['a', 'b', 'c']`. In Ruby, the `%w()` syntax is shorthand for an array of string literals.

On `line 2` the object located at index 2 of `a` is reassigned to the string literal `'-'`. While this reassignment does not change the string object at `index 1`, it does mutate the array object `a`.

The object id of `a` remains unchanged despite the reassignment that takes place at `index 1`.

This demonstrates the mutating capacity of the object assignment `[]=` method with respect to array objects. The array object was mutated, while the reference at `index 1` was changed to point to a new string object `'-'`.

The final return value from the `p` method call with `a` passed as an argument will be the array object `['a', '-', 'c']`.

If we had wanted to mutate the object at `a[1]`, we would need to use a mutating method and call it on the element reference object.

For example, `a[1] << '-'` and then `a[1].delete!('b')` would result in mutating the value referenced by `a[1]` itself and thus preserving the object_id of the element referenced by `a[1]`.

## 32 (9 object mutability/mutating methods) Time 10:22

```ruby
def add_name(arr, name)
  arr = arr + [name]
end
  
names = ['bob', 'kim']
add_name(names, 'jim')
puts names

```

In this snippet, we start on `line 5` initializing and assigning to local variable `name` the array object containing to string literals.

On `line 6`, the `add_name` method is invoked with two arguments, the object referenced by `names` and the string literal `'jim'` respectively.

Within the `a_method` definition, we can see that `a_method` is definted with two parameters `arr` and `name`. The values passed in on `line 6` are assigned to the aforementioned parameter names. So method local variable `arr` and local variable `names` both point to the same object in memory. The method variable `name` is assigned to the string literal `'jim'`.

On `line 2` the method variable `arr` is reassigned to the return value of the expression `arr + [name]`. Whether or not the object is mutated is determined here by the mutative capacity of the methods called in the expression to the right of the `=` sign. Here we see the only method called on `arr` is the `+` method. Since `+` is a non-mutating method with respect to array objects, the return object will be a new array that reflects the changes made by the `+` method.

In this case our new object will be the array object `['bill', 'bob', 'jim']`. This new object is returned by the method implicitly since it is the last line evaluated in the method.

Since the original object was not mutated within the `a_method` method invocation, the output from the `puts` method call with `names` pass in as an argument will return the original array object with its elements printed onto separate lines:
bill
bob

This demonstrates the concept of mutability in Ruby and how mutability can make Ruby appear to be a pass by reference or pass by value language. Since non-mutating methods were used in `a_method` it would appear that Ruby has only passed a value, and not a reference in this example. We know, however, that the reference was in fact passed, but no mutating methods were invoked within `a_method`.

## 33 (10 object mutability/mutating methods) Time 6:25

```ruby
def add_name(arr, name)
  arr = arr << name
end
  
names = ['bob', 'kim']
add_name(names, 'jim')
puts names

```

On `line 5` we initialize the local variable `names` and assign it to the array object `['bob', 'kim']`.

On `line 6` the `add_name` method is invoked and passed in `names` and `'jim'` as its two arguments.

Within the method call, the method variables `arr` and `name` are assigned to the object referenced by `names` and `'jim'` respectively.

At this point `arr` and `names` referenced the same object.

Therefore on `line 2` when the mutating `<<` method is called on `arr` and passed `name` as an argument, the object referenced by both `names` and `arr` is mutated and reflects the addition of `'jim'` to the array object.

Both `arr` and `names` now point to the mutated array `['bob', 'kim', 'jim']`. 

Finally, when `puts` is called on `line 7` and passed `names` as its argument, the elements of the array object are printed to the console on their own line:
bob
kim
jim
and as always, puts will return `nil`.

This demonstrates the concept of mutating methods and how ruby will appear to act as pass by reference or pass by value based on the mutative quality of the methods invoked within the method definition.

In this case, a mutating method was invoked within `add_name` and we can see clearly that Ruby is passing a reference to an object, and not a copy of the object to the method.

## 34 (1 each, map, select) Time 8:45
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
  puts num if num.odd?
end
```

On `line 1` the local variable `array` is initialized and the array containing a series of integers is assigned to it.

On `line 3` the `select` method is called on the object referenced by array. It is passed a `do..end` block with one parameter, `num`.

`select` will iterate through each element of the calling object, passing it the reference pointing to the current element being iterated over. This reference will be assigned to to the block variable `num`.

`select` returns a new array object since it is non-mutating. The numbers included in the new array object will be the objects for which the `do..end` block returns a `truthy` value. In the case of this example, the return value of the block will always evaluate as false since the `puts` method call returns `nil` and so does the if statement when the conditionalattached to it is not met.

Therefore the `select` method call will return and empty array `[]`.

This demonstrates the concept of methods that return objects based on the return value of a blocks passed to them. Specifically, how select returns values based on the `truthiness` of the block's return value on each iteration.

The overall output seen in the console will be:
1
3
5 
since `puts` is invoked only for each iteration if the conditional `num.odd?` evaluates as true. 

The return value from the `select` method call however will be an empty array object that is only visible by invoking the `p` method and passing it the return value as an argument. In that case we would see the `[]` output to the console.


## 35 (2 Each, Map, Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }

```

On `line 3` the `select` method is called on the array object referenced by the local variable `arr`. 

The select method iterates over the calling object and creates a new array object based on the return value from the block.

## 36 (3 Each Map Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
              n + 1
            end

p new_array

```


## 37 (4 Each Map Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n|
              n + 1
              puts n
            end
 
p new_array

```


## 38 (5 Each Map Select) Time

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
              word.start_with?("t")
            end

p new_array

```


## 38 (6 Each Map Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }

```


## 39 (7 Each Map Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n|
                n + 1
              end
 
p incremented

```


## 40 (8 Each Map Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
              n > 1
            end
 
p new_array

```


## 41 (9 Each Map Select) Time

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
              n > 1
              puts n
            end
 
p new_array

```


## 42 (10 Each Map Select) Time

```ruby
a = "hello"[1, 2, 3].map { |num| a }

```


## 43 (11 Each Map Select) Time

```ruby
[1, 2, 3].each do |num
  puts num
end

```


## 44 (1 Other Collection Methods) Time

```ruby


```



## 45 (2 Other Collection Methods) Time

```ruby


```


## 46 (3 Other Collection Methods) Time

```ruby


```


## 47 (4 Other Collection Methods) Time

```ruby


```


## 48 (5 Other Collection Methods) Time

```ruby


```


## 49 (6 Other Collection Methods) Time

```ruby


```


## 50 (7 Other Collection Methods) Time

```ruby


```


## 51 (8 Other Collection Methods) Time

```ruby


```


## 48 (1 Truthiness) Time

```ruby


```


## 49 (2 Truthiness) Time

```ruby


```
