### Easy 1 

#### Print in a Box
```ruby

def print_in_box(strinput)
  # Determine final length of box
  message_width = 1 + strinput.length + 1
  # Add filler spaces/dashes to make all lines same length
    # [char] + [adaptable width] [char]
  # Print appropriate lines
  corner   = '#'
  horiz    = '='
  vertical = '!'
   # 1: print top line
  line_1 = corner + horiz * message_width + corner
  puts line_1
  line_2 = vertical + (' ' * message_width) + vertical
  puts line_2
  message = vertical + ' ' + strinput + ' ' + vertical
  puts message
  puts line_2
  puts line_1
    # 2: print blank line
    # 3: print message centered
    # 4 or 2 again: print blank line again
    # 5 or 1 again: print bottom line (akak top line again)


end

print_in_box('WUALIFJL')

```

---
#### Right Triangles
```ruby
def triangle(height)
  # Bottom Right
  1.upto(height) do |stars|
    puts ('*' * stars).rjust(height)
  end
  # Top Right
  height.downto(1) do |stars|
    puts ('*' * stars).rjust(height)
  end
  # Bottom Left
  1.upto(height) do |stars|
    puts ('*' * stars).ljust(height)
  end
  # Top Left
  height.downto(1) do |stars|
    puts ('*' * stars).ljust(height)
  end

end


triangle(5)
triangle 3

triangle(5)
triangle 3

```

---
#### Madlibs

```ruby

def madlib()
  print "Enter a noun:"
  noun = gets.chomp
  print "Enter a verb:"
  verb = gets.chomp
  print "Enter an adjective:"
  adj  = gets.chomp
  print "Enter an adverb:"
  adv = gets.chomp

  puts "How much #{noun} could a #{adj} #{noun} #{verb}"
  puts "  if a #{adjective} #{noun} could #{adv} #{verb}?"

end

madlib()

```
---
#### Reverse the Digits in a Number
```ruby
def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345)
p reversed_number(54321)
p reversed_number(0)
p reversed_number(1200)

```

---
#### Get Middle Character
```ruby
def center_of(string)
  center = string.length / 2
  if string.length.odd?
    center = string.slice(center)
  else
    center = string.slice(center - 1..center)
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

```

---
#### How ol' is Teodoro?
```ruby
def thing
  age = [*20..200].sample
  puts "Teddy is #{age} years old!"
end

def thing2
  age = rand(20..200)
  puts "Teddy is #{age} years old!"
end

thing
thing2

```

---
#### How big da room?
```ruby
def how()
  puts "How long is roomy in meters?"
  longy = gets.chomp.to_i
  puts "How wide is roomy in meters?"
  widey = gets.chomp.to_i

  square_meets = longy * widey

  square_feets = square_meets * 10.7639

  puts "Areola of room is #{square_meets} square meters (#{square_feets} square feet!"

end

how

```

---
#### Cip Talculator
```ruby
def calcker()
  puts "Whats the bill, there?"
  bill = gets.chomp.to_f
  puts "Whats the tippercent?"
  perc = gets.chomp.to_f

  tip = bill * (perc / 100).round(2)
  total = (bill + tip).round(2)

  puts "The tip is $#{format("%.2f", tip)}"
  puts "The total is $#{format("%.2f",total)}"

end

calcker
```

---
#### When will I Retire?
```ruby
def retire()
  puts "How old?"
  age = gets.chomp.to_i
  puts "What age desire retire?"
  retire_age = gets.chomp.to_i

  years_until_retire_age = retire_age - age

  current_year = Time.now.year

  puts "It's #{current_year}. You will retire in #{current_year + years_until_retire_age}."
  puts "You only have #{years_until_retire_age} years to go!"
end

retire

```

---
#### Greeting a User
```ruby
def greeter()
  puts "Whats the name of you?"
  name = gets.chomp

  if name.end_with?('!')
    puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hey #{name}, how you doin?"
  end
end

greeter

```

---
#### Odd Numbers
```ruby
# 1.upto(99) do |num|
#   puts num if num.odd?
# end

# for num in (1..99)
#   puts num if num % 2 == 1
# end

puts [*1..99].select {|num| num.odd?}
```

---
#### Even Numbers
```ruby
# 1.upto(99) do |num|
#   puts num if num.even?
# end

# for num in (1..99)
#   puts num if num % 2 == 0
# end

#puts [*1..99].select {|num| num.even?}

# LS Ans:
# value = 0
# while value <= 98
#   puts value
#   value += 2
# end

```

---
#### Sum or Product of Consecutive Integers
```ruby
puts "Please enter int greater than 0"
num = gets.chomp.to_i

puts "Do you want the sum or product of all integers between 1 and #{num}?"
puts "(s)um or (p)roduct"
math = gets.chomp.downcase

case math
when 'p'
  ans = [*1..num].inject(&:*)
  math = 'product'
when 's'
  ans = [*1..num].inject(&:+)
  math = 'sum'
end

p "The #{math} of integers from 1 to #{num} is #{ans}."

```

---
#### String Assignment
```ruby
def met(number)
  if number > 1
    -number
  else
    number
  end
end
```

---
#### Always Return Negative
```ruby
def met(number)
  if number > 1
    -number
  else
    number
  end
end

p met(5)
p met(-3)
p met(0)
```

```ruby
#LS ANS
def met(number)
  number > 0 ? -number : number
end
```

---
## EASY 3
#### Searching 101
```ruby
# Alternative would be to create an array object to begin with and push the return directly to the array rather than assign to a variable name and create the array using the variables later, like i did here.

puts "Enter the num 1"
num_1 = gets.chomp.to_i
puts "Enter the num 2"
num_2 = gets.chomp.to_i
puts "Enter the num 3"
num_3 = gets.chomp.to_i
puts "Enter the num 4"
num_4 = gets.chomp.to_i
puts "Enter the num 5"
num_5 = gets.chomp.to_i
puts "Enter the num 6"
num_of_interest = gets.chomp.to_i

nums = [num_1, num_2, num_3, num_4, num_5]

if nums.include?(num_of_interest)
  puts "The number #{num_of_interest} appears in #{nums}."
else
  puts "The number #{num_of_interest} doesn't appear in #{nums}."
end

```

---
#### Arithmetic Integer
```ruby
puts "Please enter two positive ints."
num1 = gets.chomp.to_i
num2 = gets.chomp.to_i

puts(
  "#{num1} + #{num2} = #{num1 + num2}",
  "#{num1} - #{num2} = #{num1 - num2}",
  "#{num1} * #{num2} = #{num1 * num2}",
  "#{num1} / #{num2} = #{num1 / num2}",
  "#{num1} % #{num2} = #{num1 % num2}",
  "#{num1} ** #{num2} = #{num1 ** num2}",
)

# FURTHER
puts "Please enter two positive ints."
num1 = gets.chomp.to_f
num2 = gets.chomp.to_f

puts(
  "#{num1} + #{num2} = #{num1 + num2}",
  "#{num1} - #{num2} = #{num1 - num2}",
  "#{num1} * #{num2} = #{num1 * num2}",
  "#{num1} ** #{num2} = #{num1 ** num2}"
  )

if num2 != 0
  puts(
  "#{num1} / #{num2} = #{num1 / num2}",
  "#{num1} % #{num2} = #{num1 % num2}"
  )
else
  puts "Since you provided `0` for the second number, we can't perform division related operations `/` or `%`..."
end

```

---
#### Counting the Number of Characters
```ruby
puts "Please enter a word or sentence:"
sent = gets.chomp

number_of_chars = sent.delete(' ').length

puts "There are #{number_of_chars} characters in \"#{sent}\"."

```

---
#### Multiplying Two Numbers
```ruby
def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num * num)
end

square(5)
square(-8)
```

---
#### Exclusive Or
```ruby
def xor?(boo1, boo2)
   (boo1 || boo2) &&
  !(boo1 && boo2)

  !(!boo1 == !boo2)

end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

```

---
#### Palindromic Strings (Part 1)
```ruby
def palindrome?(string)
  # string == string.reverse

  count = 0
  while count < string.length
    return false if string[count] != string[-1-count]
    count += 1
  end
  true
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

```

---
#### Palindromic Strings (Part 2)
```ruby
# Case and punctuation matter
  # Convert to all lowercase.
  # Compare forwards vs reverse order
# Alternative is to 'delete' using regex like syntax:
  # string.delete('^a-z0-9')

  def palindrome?(string)
    string = string.downcase
    # Remove non alphanumeric chars:
    alphanum_string = ''
    for char in string.chars
      if ("a".."z").include?(char) ||
         (0..9).include?(char)
        alphanum_string << char
      end
    end
    alphanum_string == alphanum_string.reverse
  end
  
  p palindrome?('madam') == true
  p palindrome?('Madam') == true           # (case does not matter)
  p palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
  p palindrome?('356653') == true
  p palindrome?('356a653') == true
  p palindrome?('123ab321') == false
```

---
#### Palindromic Number
```ruby
def palindromic_number?(num)
  num = num.to_s
  num == num.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
```

---
#### Uppercase Check
```ruby
def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

```

