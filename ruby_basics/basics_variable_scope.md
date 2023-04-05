# Variable Scope
## Whats My Value? (Parts 1 - 10)
## What will the code snippets print and why?

1. 
    ```ruby
    a = 7

    def my_value(b)
      b += 10
    end

    my_value(a)
    puts a
    ```

  - This will print 7. This is due to the concept of mutability with respect to method implementation.

    After the object referenced by `a` is passed into `my_value` as an argument the method parameter then points to the same object. However, on `line 9`, `b` is reassigned to the object representing the sum of the integer object referenced by `b` and `10`. THe binding of `a` to `7` has not been altered by this action.

    At this point, reassignment is taking place, not mutation. There are two reasons for this, one is that the `+` method is non-mutating, the other is that integer objects are immutable to begin with, so there are not methods that would be able to mutate the value of `a`, only re-assign `a` to a different integer object.

2. 
    ```ruby
    a = 7

    def my_value(a)
      a += 10
    end

    my_value(a)
    puts a

    ```

  - This will output `7`.

    The concept of mutating/non-mutating methods with respect to Ruby object types and the concept of variable scoping rules with respect to Ruby methods is demonstrated here.

    The `a` referenced on `line 4` is distinct from the local variable **[top level, first level]** `a` that was initialized on `line 1`. 
    On `line 4` when `a` is re-assigned to the sum of `7` and `10`, the `a` being reassigned is the one within the scope of the method `my_value` (not the `a` from `line 1`). The reason reassignment is occurring, rather than mutating the object referenced by both `a`'s is two-fold. One is that integers are immutable objects and therefore cannot be changed. The second is that the `+=` operator (even when applied to other other object types) represents a non-destructive method (`+`) in addition to a non-destructive reassignment action (`=`).
    
    However, due to the immutability of integer objects, we cannot change the object referenced by either `a`, we can only reassign `a` to represent the object that reflects the outcome of the evaluated expression (here, `17`). The method return value will be `17`, but since the outer scope variable has not been reassigned or mutated, the output of the `puts` call will be `7` and return `nil`.

3. 
    ```ruby
    a = 7

    def my_value(b)
      a = b
    end

    my_value(a + 5)
    puts a
    ```

  - The code will output: `7` and return `nil`.

    On `line 7` when `my_value` is invoked, it is passed `a+5` as an argument. This expression will be evaluated prior to being assigned to the parameter `b`. This method call to `+` is non-mutating in addition to the immutability of integer objects. Due to either one of these concepts, the object assigned to parameter `b` is a new object. From the beginning local method variable `b` is pointing to a different object than `a` is in the outer scope.

    On `line 8`, `a` here is a variable within the scope of the method, not within the top level/main scope. Because of this, we are not re-assigning the top level `a`, but instead initializing a method variable `a` and assigning it the object referencing by `a+5`. Since `7+5` evaluates to `12`, `b` points to integer object `12` and this object is what local variable `a` within `my_value` method is referencing. Therefore while the method will output `12`, the `a` passed to the `puts` method is the one visible to that method call. In other words, the `a` initialized on `line 1`.

4. 
    ```ruby
    a = "Xyzzy"

    def my_value(b)
      b[2] = '-'
    end

    my_value(a)
    puts a
    ```

  - `my_value` will return `"-"`
  - `puts a` will output `"Xy-zy"`

  - This is due to the concept of mutating methods.
     
    On `line 7` when `my_method` is invoked, it passes the reference to the object `'Xyzzy'`, so that both outer-scope's `a` and method scope's `b` are both pointing to the same object in memory. Because of the ability to pass references and the mutability of string objects, the original object `a` is capable of being mutated by the method, provided that code within the method is mutating. Since setter methods are mutating the expression `b[2] = '-'` will replace the existing character at index 2 (currently character `'z'`) with `'-'`. The return value of setter of `String#[]` is the evaluated expression to the right of the `=` and so `my_value` returns `"-"`.

    Since the object referenced by `a` was mutated by `my_method`, the output of `puts` passing `a` as the argument will yield, `"Xy-zy"`.

5. 
    ```ruby
    a = "Xyzzy"

    def my_value(b)
      b = 'yzzyX'
    end

    my_value(a)
    puts a
    ```

  - This code will output ~~`"Xyzzy"`~~ **[Output is `Xyzzy` -> the `puts` method does not output quotation marks on string objects]**. This is due to variable scoping rules with respect to method definitions.

  - The return value of the method will always be `"yzzyX"` no matter what argument is passed in since 'assignment expression result is always the assigned value.'

  - The reason for this output from the `puts` method call on `line 8` is due to the type of method invokd within `my_value`. Within the method, the assignment operator is used. Upon implementing `my_value`, the local variable `a` and the method variable `b` are referencing the same object. On `line 4` however, `b` is reassigned and bound to a new string object `"yzzyX"`. The binding of `a` to the string object `"Xyzzy"` has not been changed, therefore the output from calling `puts` on `line 8` yields the original object, `Xyzzy`.

> Narrator: On `line 7` we invoke the `my_value` method and pass in the local variable `a` as an argument.

  Then on `line 8` we output `a`.

  `b`, which is a variable local to the `my_value` method is then pointed to the same string object (as `a`)



6. 
- This code will raise a `NameError`.

- Specifically:
  `my_value': undefined local variable or method 'a' for main:Object (NameError)`
  for the method call on `line 7`.
  The snippet will output `7` from the `puts` invocation on `line 8`. This is due to the concept of variable scoping with respect to methods. When a method is invoke, it creates an isolated scope which makes `a` from the outer scope inaccessible.

  So even though on `line 7` we pass `a` in as an argument, we are not passing in the variable name, we are binding the the variable `b` local to the method scope to the same integer object as outer scope's `a`. 

  On `line 4` when we attempt to sum `a + a`, there is no `a` local to the method scope available to pull a value from. Thus the code throws the `NameError`. 

  Further: There are two ways to fix this code. We could initialize and bind `a` to `b` (`a = b`) on the first line within the method definition so that a variable `a` is accessible, resulting in a return of `14`, or we could change `line 4` to read `b = b + b`. This would also return `14` from the method.

- **Note: local variables will be visible via 'closures' inside blocks, procs and lambdas.**

7. 
```ruby
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```

  - The call to the `each` method will return the calling object: `[1, 2, 3]`
  - The output from `puts` call on `line 8` will output `3`.

  - Each iteration of the `each` method's block will re-assign the `a` initialized in the main scope on `line 1`. This is because blocks are able to access variables in upper level scopes, so the `a` referenced on `line 5` is the `a` from `line 1`.

  - The final iteration of the block will be on the last element of the `array` object which is `3`. Thus, on `line 8` when `a` is output, it will reflect the most recent reassignment to `3`.

  > LS Ans: The scoping rules for a method invocation with a block differ from those without a block. 
  Blocks can use and modify local variables defined outside the block, unlike method variables.

8. 
```ruby
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
```

- The output from `line 7` will be "NameError". This is due to the scoping rules with respect to method calls with blocks.

  Since the variable `a` is initialized and assigned to the current value of `element` on each iteration of the block, it is only available within the block environment or scope. To put it another way, the expression `a = element` on `line 4` is initialization and not reassignment.

  When `puts` tries to access the object referenced by `a`, there isn't one available within its scope.

8. 
```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

```

- The output from `puts` call on line 8 will be `7`. This is due to the concept of variable shadowing. When upon each iteration of the block that was passed to the `each`method, the block variable `a` is initialized and assigned to a sum of itself and `1`. Since the block parameter name is shared by the variable local to the main scope, the block only see's the `a` local to the block, and therefore is unable to access the `a` located in the outer scope from line 1.

> LS Answer: Shadowing occurs when a blcok apraemter hides a local variable that is defined outside the block. Since the outer `a` is shadowed, the `a += 1` has no effect on it. In fact, the statement has no effect at all.

  When Ruby goes looking for a variable `a` it first searches within the current scope (which is the block). Since it finds an `a` within the block, it stops looking and never 'sees' the local variable `a` from line 1.


10. 

```ruby
a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a

```

Line 11 call to `puts` will output `7` and return `nil`.

The return value of the `my_value` method call on line 10 will return .

This is due to the concept of variable scope with respect to method invocations. When a method is called, a new isolated scope is created. Variables initialized outside the method are not accessible inside the method unless a reference to them is passed in as an argument. Since the reference held by local variable `a` on line 1 is not directly or indirectly passed into the method, any changes to a method local variable `a` will not be seen in the outer scope. Since `a` is inaccessible to the method, when ruby attempts to evaluate line 6, it will raise a 
~~NameError. `a += b` is ruby syntactical sugar for `a = a + b`. In order to evaluate the expression `a + b` we must have a value for `a`. Since `a` has not been initialized within the scope of the method
and the `a` outside the method is inaccessible due to scoping rules, ruby has no choice but to raise the exception.~~

**NoMethodError**. This is due to the fact that code is parsed prior to being run. When ruby parses the code, it allocates space in memory for variables that appear before an assignment operator `=`. Line 6 appears to initalize variable `a`, but at this time, ruby simply points `a` to the `nil` object.

When evaluating line 6 after `my_method` invocation, ruby essentially attempts to evaluate `nil.+(1)` Since the `Integer#+` method cannot be called on `nil` class, we see the NoMethodError raised.

If line 6 had read `a + 1` instead, ruby would raise a NameError instead. It is the `Kernel#=` method that creates the association between `nil` and `a` during the parsing process.

