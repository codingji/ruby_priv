# Things to remember

- methods should have either
  - a side effect 
    OR
  - a meaninful return value
  BUT not both.

# The methods...

## Comparable

- `Comparable#between?(min, max)`
   > Any class with a `<=>` operator can use this method.

## Enumerable

- `Enumerable#include?`
  - `Array#include?(ele)`
  - `Hash#include?(key)`
  - `Range#include?(obj)` -- > `obj` can be letter or num
  - `String#include?(substring)`

## Kernel

- `Kernel#rand(num)` --> `num` is a non-inclusive integer

## Array

- `Array#prepend(obj)`

- `Array#push(obj)` or `Array#<< obj`

- `Array#flatten(!)`

- `Array#reduce` or `Array#inject`

## String

- `String#concat(*args)` can take more than one argument!!

- `String#casecmp` or `String#casecmp?` case-insensitive string comparison
  > 'Roger'.casecmp('RoGeR') => returns `-1`, `0`, `1` or `nil`
    -  0 : same
    - -1 : the calling string is alphanumerically before argument
    -  1 : the calling string is alphanumerically after argument
    - nil: the caller and argument are not comparable
  > 'Roger'.casemp?('RoGeR') => returns `true`, `false`, or `nil`

- `String::new` is a class method and referenced in writing as `::new`

- `String` objects in single quotes ('stuff') ONLY allows for escape character `\'` and `\\`(other single quotes) but NOT for chars like `\n`... `puts 'Hello\nWorld'` would output: `Hello\nWorld`

- `%Q(Type your string here without double quotes.)`

- `%q(Type your string here without single quotes.)`

# Other nifty tricks...

## HEREDOCs
  ```ruby
  info = <<HEREDOC

  "BLAH"

  HEREDOC
  ```
## Percent Strings `%q` delimiters can be most non-alphanumeric chars

```
These are the types of percent strings in ruby:

%i{a b c} => [:a, :b, :c]
    Array of Symbols

%q(a b c) => ["a", "b", "c"]
    String

%r[a b c]
    Regular Expression

%s<a b c>
    Symbol

%w|a b c|
    Array of Strings (note: must escape spaces if not separate words)
    %w[one one-hundred\ one]
    #=> ["one", "one-hundred one"]

%x^a b c^
    Backtick (capture subshell result)
```

## ternary operator

- <condition> ? <result if true> : <result if false>

  ternary expressions should be used to choose between TWO VALUES
  (not two actions)

  do this => `puts (boolean ? "I'm true!" : "I'm false!")`
  not this => ~~`boolean ? (puts "im true") : (puts "im false")`~~

## case statements (can have `else` clauses)

- make sure to line up the `then` portion of the statements or other portions to make the code readable.

  ```ruby
  case var
  when x then y
  when z then w
  else   then d
  end
  ```

## keywords to remember for looping (enumerator) methods

- exit and exit! break out of all loops and quit program

- break

- next

- return (when given without a value ex. `return 54`, will return `nil`

- unless

  > `something unless condition`

    OR

    ```ruby
    unless conditional
      do something
    end
    ```


## syntactical stuff

- Writing multi-line blocks on one line
  - `{ block code; second line; third line; etc }`
    > `loop { puts "running loop"; break }`

# DONT FORGET

- `until` will run 'inclusively' so the code:

  >
    ```ruby
    number = 0

    until number == 10
      # next if number.odd? # FE: Why not here?
      number += 1
      # next if number.odd? # My added line
      puts number
      next if number.odd? # FE: Why not here?
    end
    ```
    will run `until number == 10` which means it will run when number == 10, but not when number == 11.

- When `to_i` method is run on a non-numeric string it will return `0`.