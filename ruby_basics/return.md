# What will the code print and why?

Bfast,Lunch,Dinner P1 - Time 1:01

```ruby
def meal
  return 'Breakfast'
end

puts meal
```

This code will output:
Breakfast (no quotations)

This is beacuse the `puts` method takes the return value of the method call to `meal` (which is "Breakfast") and prints it to the screen without quotes.

BLD P5 - Time

```ruby
def meal
  'Dinner'
  puts 'Dinner'
end

p meal
```
=>
Dinner
nil
