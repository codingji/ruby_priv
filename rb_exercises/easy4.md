# Further Explorations to do:
-[ ] 3 (Leap 1) -Write Leap Years in Reverse?
-[ ] 5 (Mult of 3 & 5) -Rewrite using `Enumerable#inject/reduce`
-[ ] 7 (String to Integer) -Convert Hexadecimal String to Integer
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

# What Century is That?
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

# Easy 4 - 3 Leap Years (Part 1)

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
# Palindromic Substrs
```ruby
def palindrome?(string)
  string.length > 0 &&
  string.chars == string.chars.reverse
end

# p palindrome?('cat')
# p palindrome?('dopapod')
# p palindrome?('tat')
# p palindrome?('t')
# p palindrome?('')

def palindrome_substrings(strinput)
  palindromic_substrings = []

  strinput.chars.each_with_index do |letter, index|
    sub_string = strinput.chars[index..strinput.length - 1]
    # Create substrings of substring and determine if its a palindrome
    while sub_string.length > 1
      palindromic_substrings << sub_string.join if palindrome?(sub_string.join)
      sub_string.pop
    end
  end
  p palindromic_substrings
end

palindrome_substrings("abcddcbA")
```

# Mult 3 & 5
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

# Running Total
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

## FUrther EXplaorataon
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