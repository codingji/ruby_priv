# Print While
## Using a while loop, print 5 random numbers between 0 and 99 inclusive.

```ruby
numbers = []

while numbers.size < 6
  numbers.push((0..99).sample)
end

puts numbers
```

## Loops 2 Only Even

Using `next`, modify the code below so that it only prints positive integers that are even.

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

FE: Why did next have to be placed after the incrementation of number and before #puts?

`next` needed to be placed on the line prior to incrementing `number` because if not, the incrementation will never execute once `number == 1` leaving the loop to infinitely execute because `number` will always be `1`.

Placing the `next` statement after the incrementing expression will give us the ability to reach the `break` statement point in the code.

If we place the `next` expression after the `puts` method call, we will not 'skip' to the next iteration until after the odd value is passed to the puts method. This would effectively make the `next` expression useless since ruby would already be moving to the next iteration anyways. So this would output 1-10 as if nothing had changed from the original method.

## Loops 2 First to Five

The following code increments number_a and number_b by either 0 or 1. loop is used so that the variables can be incremented more than once, however, break stops the loop after the first iteration. Use next to modify the code so that the loop iterates until either number_a or number_b equals 5. Print "5 was reached!" before breaking out of the loop.

  ```ruby
  number_a = 0
  number_b = 0

  loop do
    number_a += rand(2)
    number_b += rand(2)
    puts "#{number_a} and #{number_b}"
    # next if number_a < 5 && number_b < 5 # My orig ans
    next unless number_a == 5 || number_b == 5 # Better LS answer
    puts "5 was reached!"
    break
  end
  ```

  FE: Is using next the best option for this example? Could you use an if/else statement instead?

  ```ruby
  loop do
    puts "#{number_a} and #{number_b}"

    if number_a < 5 && number_b < 5
      number_a += rand(2)
      number_b += rand(2)
    else
      puts "5 was reached!"
      break
    end
  end

  ```

    > For ease of understanding the purpose of the loop, I think the if/else statement is easier to quickly make sense of.