2. Locate desc. of `while` loop in ruby doc.
  - Pages > control_expressions @ https://docs.ruby-lang.org/en/3.0/index.html

3. The return value of `while`?
  - `nil` **unless** `break` is used to return something
  ```ruby
  int = 1

  cat = (while int < 4
          puts int
          int += 1
        end)

  p cat =>  1
            2
            3
            nil # return value of while loop is `nil`
  ```

4. Return value of break?
  - unless specified, `break` returns `nil`
    ```ruby
    int = 1

    cat = (while int < 4
            puts int
            int += 1
            break
          end)

    p cat =>  1
              nil # return value of break is `nil`
    ```

5. a. How can you write large numbers in a way that's easier to read? Where is this in the documentation?

    > You can write them with underscores:
        `123_456_789` is the same as `123456789`

    >    This info is located under `Home > Literals > Numbers` menu @ https://docs.ruby-lang.org/en/3.0/index.html

   b. Can you place underscores anywhere? Like this for ex. `4823_7324_38`?

    > `Yes`

6. Where in docs will you find how to write a `Symbol` that reps your name?

  - Under `Home > literals > Symbols` @ https://docs.ruby-lang.org/en/3.0/syntax/literals_rdoc.html#label-Symbols
  - Under `Classes > Symbol` @ https://docs.ruby-lang.org/en/3.0/Symbol.html

  - Ans: `:my_name`

7. https://docs.ruby-lang.org/en/3.0/String.html

  - Note: the `#` denotes `instance methods`
          the `::` denotes `class and modules methods`

8.

  > Right Justified = `String#rjust`

  https://docs.ruby-lang.org/en/3.0/String.html#method-i-rjust

    > string.rjust(character_spaces)

  > Left justified = `String#ljust`

  https://docs.ruby-lang.org/en/3.0/String.html#method-i-ljust

  > Centered = `String#center`

  https://docs.ruby-lang.org/en/3.0/String.html#method-i-center

# Reading Documentation 2

1. How would you use `String#upcase to create an uppercase version of "xyz"?

  ```ruby
  capt = 'xyz'.upcase

  Alternates:

  puts 'xyz'.upcase
  puts "Interpolated #{'xyz'.upcase}"
  z = 'xyz'.upcase + 'zyx'.downcase

  ```

2. How use `Array#insert` to add 5, 6, & 7 between elements c and d when `a = %w(a b c d e)`?

insert(index, *objects) -> self ## returning self in this instance means destructive method!

when index >= 0, inserts all given objects BEFORE the element at offset index.

  ```ruby
  # Elements `c` and `d` are 'offset' index 2 and 3. We want to add all elements before offsex index 3, so thats our first argument. Then the elements we which to insert are listed as the remaining arguments.

  a.insert(3, 5, 6, 7)

  ```

3. What will each `puts` statement print?

`Array#inspect` is an alias for `Array#to_s`.

```ruby
s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
`"["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]"`
=> `nil`
puts s.split(',').inspect
`"["abc def ghi", "jkl mno pqr", "stu vwx yz"]"`
=> `nil`
puts s.split(',', 2).inspect
`"["abc def ghi", "jkl mno pqr,stu vwx yz"]"`
=> `nil`

```

# END


