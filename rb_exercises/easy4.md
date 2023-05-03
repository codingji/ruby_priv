
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

