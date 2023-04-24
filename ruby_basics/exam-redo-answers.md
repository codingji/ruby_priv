# 1

We get a `NameError`. This is because `another_num` is not a variable name local to the main scope. In order to fix this issue, we need to initialize a variable with that name in the same scope as the `puts` method invocation.

So we will add this initialization where specified to get the intended output.

This problem is due to the concept of variable scope in Ruby with respect to blocks. The passing of a `do..end` block to the `loop` method on `line something` defines a new scope. Blocks are able to access variables in higher level scopes, but scopes cannot access variables within lower level scopes. So in this case, if we want to be able to access a value within a lower level scope, we must initialize it within an outer scope, allow it to be manipulated, and then see what the new value of that variable is afterwards.

```ruby
array = [2, 4, 6, 8]

another_num = nil

index = 0

loop do
  puts (array[index] - 2)
  another_num = array[index] - 2
  index += 1
  break if (array.size) == index
end

puts another_num

=> 
0
2
4
6
6
```

# 2

This code calls `puts` within the `for` loop and so will output a value upon each iteration. Then it will also output a final time on `line x`. We will see 5 outputs to the console.

2
4
6
8
8

The reason for this is due to scoping rules of `for` loops. Since `for` loops are not method invocations but rather Ruby language keywords, the `do..end` block following the initiation of the `for` loop is not creating a new scope. This means variables that are initialized within this loop are accessible within the same scope that the `for` loop is in. For this reason, we can access the local variable `a_num` and so instead of a `NameError` we will see the final integer object `a_num` is assigned to which was `8`. 

The `for` loop iterates through the object `array` element-by-element. For each iteration the local variable `num` will be assigned to the element in `array` beginning with the first index and ending with the last index. For each iteration, the current object referenced by `num` will be passed to the `puts` method and output to the console. Then, the local variable `a_num` will be assigned to that object as well. On each subsequent iteration the local variable `a_num` will be reassigned to the current element that is being iterated over. So the object referenced by `a_num` at the time of passing it to the `puts` method on `line x` will be the most recent reassignment (which was the integer object `8` aka. array at its last index.)
This is why we see `8` output to the console.

Two main differences between `for` loops and the `loop` method is that `for` loops iterate a finite number of times while `loops` require a `break` condition to terminate the loop.

`for` loops also exist in the same scope they are initiated in, whereas the `loop` method requires a block and this block defines a new scope.

# 3

This code will output `NameError`. Even though both `do..end` blocks in this example are one level lower than the main scope, they are distinct scopes and are unable to access variables from each other. Peer scopes are separate scopes. In order to access information from one peer scope in another peer scope, the variable must be available to them both, meaning it must be intialized within their shared parent scope. 

To remedy the `NameError` we simply need to initialize a local variable in their shared parent scope with the name 'name'.

`name = ''` can be added. Then within the first `do..end` block when we were initializing a block variable named 'name' we are now instead reassigning the main scope variable to the string object `'Jilly Bean'`. This variable  is then accessible to the peer scope of the second `do..end` block. When `name` is passed to the `puts` method as an argument, there is now a variable with the name 'name' available for use. Since blocks can affect the reassignment of variables in their parent scope, we see the output of `Jilly Bean` as opposed to the original empty string object.

# 4

This code raises an error due to scoping rules in Ruby with respect to nested blocks. Scopes are able to access local variables in their parent's scope, but not in the scopes of lower levels. For this reason when we attempt to pass the local variable `last` during our invocation of the `puts` method on `line x`, we receive a `NameError`. `first` is available since it is located in a higher level scope, and `middle` is accessible because it is located within the same scope as the invocation of the `puts` method. `last` however, is a variable initialized within the lowest level scope. (One lower than the scope in which we are trying to access it.) From here, there is not access to this variable unless it was initialized in the current scope or higher. In order to access this variable, we simply need to initialize it in the same scope as the `puts` method, or higher. We can simply add 
`last = ''` either in the main scope or the first level scope.

# 5

Variable shadowing is the concept whereby a variable in a higher level scope is inaccessible in a lower level scope because a parameter shares the same name as the variable in the higher level scope. The parameter name casts a 'shadow' over the variable in the higher level scope.

For example,
```ruby
cat = 'meow'

1.times do |cat|
  cat = 'hiss'
end

puts cat # Outputs `meow`

```

In this example, the block variable `cat` is reassigned to the string object `'hiss'` from its original object of `0` passed to it from the `times` method.

The main scope variable `cat` is left unchanged and we see this from the output of passing it to the `puts` method on `line c`.

If we wanted to change the local variable `cat` from `line 1` we simply need to change the parameter name to anything other than `cat`.

# 6
On `line 8` when invoking the `p` method and passing it the return value of invoking `bigger` with `alice_height` as the sole argument, we get the expected output of `108.0`. This is because the return value of the `bigger` method is implicitly returned because it is the last (and only) line of the method.

On `line 10` we get a `NameError` because of scoping rules in Ruby with respect to methods. Methods have their own isolated scope and variables initialized inside the body are not accessible outside. In order to fix this we would need to initialize a variable named `bigger_height` outside the scope of the method and assign the return value to that variable.

On `line 12` we receive the output `50` because the object referenced by `alice_height` was not mutated within the `bigger` method. The reason for this is because integer objects in Ruby are immutable. Furthermore, had the object been a mutable one, such as a string, within the method itself the methods invoked on the object referenced by `height` were non-mutating and so rather than mutating the object, a new object was returned. This reassignment has to effect on the variables outside the method. When working with immutable object types or utilizing non-mutating methods, Ruby behaves as a pass-by-value language.

This snippet demonstrates both pass-by-value behavior of Ruby, as well as variable scoping rules with respect to methods.

# 7

The code on `line 8` is doubled because it is returning and outputting the return value of the method invocation of the doubler method, however the method itself does not mutate the object referenced by the variable `plant` that was passed into it.

Within the `doubler` method, the object referenced by `string` and `plant` has the `+` invoked on it and passed the same object reference `string` as its argument. This non-destructively concatenates the existing string object `"string bean"` to the same string object `"string bean"`, and returns a new object that reflects this concatenation. This is why we see `"string beanstring bean"` output to the console.

On `line 10` we can see that the object itself was not mutated and that is why the original string object `"string bean"` is output and returned from the `p` method invocation.

This demonstrates the concept of mutability in Ruby and how mutability affects the apparent behavior of Ruby as a pass-by-value language or a pass-by-reference language. Here Ruby behaves as a pass-by-value language. Even though string objects are mutable in Ruby, a mutating method was not invoked on the object referenced by `plant` or `string` and so the output is a new object. This creates the appearance of having passed in a copy of the value rather than a reference to the string object itself. We however know, that had a mutating method been invoked on the object referenced by `string` and `plant` that the  output from `lines 8 and 10` would have been the same since all mutations are reflected in all the aliases of an object.

# 8 

The code on `line 8` still outputs the string object `'string bean'` because methods have their own isolated scope. At method invocation, the main scope local variable `plant` is pointing to the same location in memory as the method variable `string`. This does not give the method access to the assignment of `plant` itself. A copy of the reference to an object is passed into the `doubler` method, not the ability to reassign the variable containing that reference. So, on `line 2` when we assign the return value of calling `+` on `string` and passing it `string` as an argument we are simply reassigning the method local variable to this new object. And now `plant` and `string` point to two different locations in memory. We can see this is what happened by comparing the output from `line 6` with `line 8`.

This demonstrates the limitations of methods in terms of their isolated scope. Methods cannot change assignments of variables outside their scope, they can only mutate the objects referenced by those variables if mutating methods are invoked and the objects themselves are mutable.

# 9

The output and return of both `line 6` and `line 8` is `"string beanstring bean"`. This is because the mutating method `<<` was called within the `doubler` method on the object referenced by the method local variable `string`. The main scope local variable `plant` also references this location and so plant and string in this example are considered aliases of the same location in memory and all mutations that affect that object will be reflected in all variables pointing to that object. This is why we see the mutation that takes place using the method local variable `string` is visible when accessing that same object using the main scope variable `plant`.

# 10

