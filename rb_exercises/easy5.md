-[ ] After Midnight 1
  -[ ] One liner that normalizes the time using `%`
  -[ ] Use Ruby `Date` and `Time` classes
  -[ ] What if we needed to know the day of the week as well if given a start point of midnight Sun.
-[ ] After Midnight 2 - Using `Date` and `Time` classes



# 1 ASCII String Value
Convert a string to its ASCII value sum.

map ascii values
sum
```ruby
def ascii_value(string)
  string.chars.map do |char|
    char.ord
  end.sum

end

```
## 1 Further Exploration

char.ord.<mystery> == char

mystery --> `Integer#chr`

# 2 After Midnight (Part 1)

input: integer repr. minutes before (-) or after (+) midnight
output: string object representing time on a 24-hr clock

array (divmod)?

Problems:
- handle sign
  - <=> 0, etc.
- calculate time after midnight if minutes exceed one full day (need to start at 0 again
  - divmod give you quotient and remainder
- converting the output into a string object (formatting)
  - format, sprintf, ?




```ruby
def time_of_day(minutes)
  # Convert minutes into hours:mins
  # If negative (-), then the negative sign attaches to hours.
  hours, mins = minutes.divmod(60)
  p [hours,mins]
  # Convert to 24 time format
  hours = hours % 24

  format("%02i:%02i", hours, mins)

end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
p time_of_day(3000) == "01:29"

```

## 2 Further Explorations
### Problem 1

The % operator's interaction with negative values is confusing and difficult to remember, as described in the Introduction to Programming with Ruby Book. Because of that, we recommend not using % with negative numbers, but that you should first convert the negative values to positive numbers so you can write more explicit code. This problem is one such place where it's probably easier to take this approach.

However, that doesn't mean you can't use % at all. In fact, it's possible to write a single calculation with % that performs the entire normalization operation in one line of code. Give it a try, but don't spend too much time on it.

### Problem 2

How would you approach this problem if you were allowed to use ruby's Date and Time classes?

### Problem 3

How would you approach this problem if you were allowed to use ruby's Date and Time classes and wanted to consider the day of week in your calculation? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

# 3 After Midnight (Part 2)

Convert a string input of a 24-hr time into minutes between 0..1439

Two Methods:
- before_midnight
- after_midnight

input:
- string object repr. hours:mins (can be between 00:00 and 24:00)
output:
- integer object repr. time in mins between 0..1439

reqs:
- 00:00 and 24:00 will return 0

problems for both:
- convert string object into numerical objects (hours and minutes)
  - delete quotation marks and split via ':' char
- convert hours and minutes into minutes

prob for before:
- starting from 0, subtract the converted minutes

prob for after:
- starting from 0, add the converted minutes

```ruby
def before_midnight(string_time)
  hours, minutes = string_time.split(':').map(&:to_i)

  # 1440 is the equivalent of 00:00, 1439 would be 23:59
  time = 1440 - ((hours * 60) + minutes)
  
  time == 1440 ? 0 : time
end

def after_midnight(string_time)
  hours, minutes = string_time.split(':').map(&:to_i)

  time = (hours * 60) + minutes

  time == 1440 ? 0 : time
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

```

# 4 Letter Swap

```ruby
def swap(sentence)
  sentence.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
```

# 5 Clean up the Words

Replace non-alphabetic chars with spaces, then squeeze. spaces.


```ruby
def cleanup(string)
  str = string.chars.map do |char|
    [*'a'..'z'].include?(char.downcase) ? char : ' '
  end.join
  str.gsub(/ +/, ' ')
end

p cleanup("---what's my +*& line?") #== ' what s my line '

```

# 6 Letter Counter (Part 2)

input: string
output: hash with integers as keys and values, key = length, value = frequency

req: empty string => empty hash

```ruby
def word_sizes(string)
  count_hash = Hash.new(0)

  string.split.map(&:length).sort.each do |length|
    count_hash[length] += 1
  end
  count_hash
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

```

# 7