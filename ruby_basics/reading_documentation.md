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

7. 