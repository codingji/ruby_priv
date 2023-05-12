# Further Explorations to do:
-[✓] 3 (Leap 1) -Write Leap Years in Reverse?
-[✓] 5 (Mult of 3 & 5) -Rewrite using `Enumerable#inject/reduce`
-[✓] 6 (Running Totals) -Rewrite using `#each_with_object` and `inject`
-[✓] 7 (String to Integer) -Convert Hexadecimal String to Integer
-[ ] 7 (String to Integer) -refactor to reduce repetitive code sections
-[ ] 9 (Integer to String) -Find mutating and non-mutating methods that don't use `!` to distinguish their mutatative quality
-[ ] 10 (Integer to String) -refactor LS answer

# 1 Short Long Short

```ruby

def short_long_short(str1, str2)
  (str1.length > str2.length) ? (str2 + str1 + str2) : (str1 + str2 + str1)
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

```

# 2 What Century is That?
```ruby
def century(year)
  # When doing this division, we make it a float to preserve any remainder. If a remainder exists `ceil` will round it up to the next whole integer.
  # Ex. year 2001 / 100.0 => 20.01 (.ceil)=> 21
  # vs.
  # year 2001 / 100 => 20
  century = (year/100.0).ceil

  # This breaks apart the last two digits of the century so they can be used to determine the proper suffix to use during output.
  ones_place, tens_place = century.digits[0..1]

  # This determines the suffix.
  suffix = case ones_place
           when 1..3
             if tens_place == 1
               'th'
             else
              case ones_place
              when 1 then 'st'
              when 2 then 'nd'
              when 3 then 'rd'
              end
            end
           else 'th'
           end
  # Final output to console:
  "#{century.to_s}#{suffix}"

end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
```

# 3 Leap Years (Part 1)

```ruby
# Takes a positive integer as a year (gregorian) and outputs whether or not its a leap year. (boolean)

def leap_year?(year)
  # if divisible by 4 then leap year true
    # unless also divisible by 100 false
      # unless also divisible by 400 true
  return true if year % 400 == 0
  return true if year % 4 == 0 unless year % 100 == 0
  false

end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

```
# 4 Leap Years (Part 2)
Add a clause that will handle years prior to 1752. During this time a leap year is simply every 4th year (including 1752).

Ans:
I will reuse my code from before and just add an if clause to handle years including and prior to 1752.

if 

```ruby
def leap_year?(year)
  if year <= 1752
    return true if year % 4 == 0
  else
    # if divisible by 4 then leap year true
      # unless also divisible by 100 false
        # unless also divisible by 400 true
    return true if year % 400 == 0
    return true if year % 4 == 0 unless year % 100 == 0
  end
  false
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
```
  ## Further Exploration:
  Can you write the code in this order? And is it simpler or more complex than original solution.

  if year % 4 == 0
  if year % 100 == 0
  if year % 400 == 0

  Algos:
  - Use flags? Do the math and if yes/no change a flag and then check the flag combo (an array) at the end. [y, n, n] == true || [y, y, n] == false || etc.
  - Simple Branching Statements (will be more complex because sections repeated).
  ```ruby
  def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0 && year % 400 == 0
      return true
    elsif year % 100 == 0
      return false
    else
      return true
    end
  end
  false
  end

  ```

# 5 Mult 3 & 5
input: integer greater than 1
output: integer rep. sum of multiples of 3 and 5 between 1 and the input. (1..input)

problems to solve:
1. find all multiples of 3 and 5 in the range created
2. sum the list of multiples/factors
3. return sum

```ruby
def find_multis(max, int)
  running_total = 0
  iteration = 1
  multis = []

  loop do
    running_total += int
    break if running_total > max
    multis << (iteration * int)
    iteration += 1
  end
  multis
end

def multisum(integer)
  find_multis(integer, 3).union(find_multis(integer, 5)).sum
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

```

## Further Exploration
Investigate Enumerable.inject (also known as Enumerable.reduce), How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) Try writing such a solution. Which is clearer? Which is more succinct?

This method (`Enumerable#inject` / `Enumerable#reduce`) might be useful in order to perform a repeated operation on each element in the array object.

By using `Array#sum`, I basically did the equivalent of `array.inject(:+).
If I had needed to get the product, quotient or difference from all the numbers (anything besides the sum) I couldn't use `Array#sum` so this is where `reduce` or `inject` really shines because they are so versatile.

```ruby
# Helper Methods:
def mult_of_3?(num)
  num % 3 == 0
end

def mult_of_5?(num)
  num % 5 == 0
end

# Main Method:
def multisum(max_val)
  # Find all multiples of 3 or 5 in a number and then sum all those factors.
  multiples = []
  1.upto(max_val) do |number|
    if mult_of_3?(number) || mult_of_5?(number)
      multiples << number
    end
  end
  multiples.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

```
I think in both cases the use of `inject`/`reduce` is going to be both more succint and also clearer in the even we are finding something besides the sum.

# 6 Running Totals
input: array of ints
output: array of ints with cumulative sum of values

?s: new array object or same array object returned?

req: 
- empty input array returns empty array
- single element array returns same array (not necessarily same object)


problems:
1. sum while iterating (inject? uses memo, operation/block)
  - `object.inject { |running_total, current_val| sum + n }`
2. map or push values to a new array

```ruby
def running_total(array)
  arr = []
  if array.empty?
    return arr
  else
    arr << array.inject do |sum, val|
             arr << sum
             sum + val
           end
  end
  arr
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []

```
## 6 Further Exploration
Try solving this problem using Enumerable#each_with_object or Enumerable#inject (note that Enumerable methods can be applied to Arrays).

```ruby
def running_total(array)
  # Try solving using `Enumerable#each_with_object` and/or `Enumerable#inject`
  array.each_with_object([]) do |number, running_sum|
    if running_sum.empty?
      new_total = number
    else
      new_total = [running_sum.last, number].inject(:+)
    end
    running_sum << new_total
  end
  
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

```

# 7 - Convert a String to a Number!

input: string
output: integer

req:
- cant use `String#to_i` or `Integer()`

- all valid numeric characters
- no plus or minus signs

- calculate the result by analyzing the characters in the string
   - (comparing the string version of the integer with the integer)

thoughts:

map and compare digit by digit (then i only have to check 10 different 'integers' instead of something like counting and comparing and needing to move thru 4321 iterations before finding the answer)

Problem:

- how to compare the string to the integer
  - (0.to_s == char)

- iterate thru each character from input string and compare it to a string version of an integers 0..9 until one is true
  - when true push that integer to a new array
- multiply the indices of each digit by the appropriate 'place' (tens, hundreds, thousands, etc)
- take the sum of all the above unique multiplication operations
- return that sum

```ruby
def string_to_integer(strinteger)
  int_array = []

  strinteger.each_char do |char|
    [*0..9].each do |num|
      if num.to_s == char
        int_array << num
      end
    end
  end
  final_int = int_array.reverse.map.with_index do |integer, index|
                integer * (10 ** (index))
              end

  final_int.sum
  # For #9 just replace above line with this line:
  # strinteger.start_with?('-') ? -final_int.sum : final_int.sum

end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('3489271287') == 3489271287
```
## 7 Further Exploration
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

```ruby
def hexadecimal_to_integer(hex_num)
  hex_chart = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "A" => 10,
    "B" => 11,
    "C" => 12,
    "D" => 13,
    "E" => 14,
    "F" => 15
  }

  # Each 'place' is [10**3, 10**2, 10**1, 10**0] in base 10 system.
  # In hexadecimal  [16**3, 16**2, 16**1, 16**0] in base 16 system.

  # Convert each integer to its base 10 equivalent integer, then multiply by the appropriate power of 16.

  converted_digits = hex_num.reverse.chars.map.with_index do |char, index|
                       hex_chart[char.upcase] * (16 ** index)
                     end.sum

end

p hexadecimal_to_integer('4D9f') == 19871
```

# 8 Convert a String to a Signed Number

Reuse old method but add in a conditional in which the first char of the string object is looked at and then proceed accordingly
- if the string doesn't begin with '-'
  - proceed as usual
- if it does
  - take the negative at the very end of the problem

just add:
`strinteger.start_with?('-') ? -final_int.sum : final_int.sum`
- since the `each_char` block is only pushing digits to the new array object, leading non-integer characters are already ignored.
- all i have to do is check to see if the first character was a negative sign and then take the negative of the final sum

```ruby
def string_to_signed_integer(num)
  num_chart = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
  }

  # Each 'place' is [10**3, 10**2, 10**1, 10**0] in base 10 system.

  # Convert each string object to its integer equivalent, then multiply by the appropriate power of 10 for the index.
  num_arr = []

  num.reverse.chars.each_with_index do |char, index|
    if [*'0'..'9'].include?(char)
      num_arr << num_chart[char] * (10 ** index)
    end
  end
  
  num.chars.first == '-' ? -num_arr.sum : num_arr.sum

end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

```

## 8 Further Exploration
In our solution, we call string[1..-1] twice, and call string_to_integer three times. This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.

```ruby
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

# Refactored Code:

```

# 9 Convert a Number to a String

P: Convert an integer input into its string representation without using the `to_s`, `String()`, or `Kernel#format` methods.

Input = string
Output = integer

Problems =
-how to convert an integer to a string
  - Hash to 'translate' string to integer
-repeat this process for all values
  - break string into array of characters
  - use hash to convert each string to integer and now have an array of integer objects
-how to calculate total value?
  - multiply each index by appropriate power of 10

```ruby
def integer_to_string(integer)
  int_to_string = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9'
  }

  integer.digits.reverse.map do |number|
    int_to_string[number]
  end.join

end

```

# 10 Convert a Signed Number to a String!


```ruby
def integer_to_string(integer)

  if integer == 0
    return '0'
  end

  int_to_string = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9'
  }

  string_num = integer.abs.digits.reverse.map do |number|
                 int_to_string[number]
               end.join

  integer < 0 ? string_num.prepend('-') : string_num.prepend('+')

end

p integer_to_string(4321) == '+4321'
p integer_to_string(0) == '0'
p integer_to_string(-5000) == '-5000'
```

## Further Exploration
Refactor to reduce 3 method calls to one.
- need to do

```ruby
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
```