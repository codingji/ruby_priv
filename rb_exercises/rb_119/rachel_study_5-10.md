blems:

- find all substrings
- assess if any substrings are sorted alphabetically
- if yes, find the one that is longest.

def longest(string)
  loop do
  
  

end

def substrings(string)
  start_index = 0
  end_index = -1
  substrings = []
  
  loop do
    substrings << string.slice[start_index..end_index]
  
  end
  substrings
end

```ruby
=begin
# You will be given a number and you will need to return it as a string in expanded form. For example:
#
# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
#
# Note: All numbers will be whole numbers greater than 0.

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'


Problem: convert an integer into a string object where each 'place' is separated out. so 453 would be 400 + 50 + 3 (hundreds, tens, thousands)

input: integer
output: string repr. expanded version of input integer

ds: array of strings to allow created with split and iterated over

problems:
- turn string into an array of integers
  - integer.digits where index will be equal to the power to which 10 is raised
  => array of integers in order from lowest to highest place (1s..Ns)

-the following need to be able to adapt to any number of integers
  - multiply each integer by its appropriate power of 10 (index == power)
  => reversed output integers with appropriate value for place
  - reverse this output again to return it to the original order for which to interpolate 
  => integers in sequential order from largest to smallest ready to be interpolated
  - interpolate each value into a string object
    - each value will need to be concatenated into the string with a '+' following it unless its the last integer in which case no '+' is added
      - could also not worry about the last '+' and simply delete it at the very end


=end


def expanded_form(integer)
  places = integer.digits
  places.map!.with_index do |number, index|
    number * (10**index)
  end

  output_string = ''
  places.reverse.each do |number|
    next if number == 0
    output_string << "#{number.to_s} + "
  end
  output_string.delete_suffix(' + ')
end

p expanded_form(426)
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

```

```ruby
require 'pry'

=begin

problems:

- find all substrings
- assess if any substrings are sorted alphabetically
- if yes, find the one that is longest.

=end

def substrings(string)
  start_index = 0
  end_index = 0
  substrings = []
  loop do
    
    loop do
      substrings << string.slice(start_index..end_index)
      end_index += 1
      break if end_index >= string.length
    end
      start_index += 1
      end_index = start_index
    break if start_index >= string.length
  end
  substrings
end

def substrings(string)
  substrings = []

  string.chars.each_with_index do |char, index|
    string.chars.each_with_index do |second_char, second_index|
      substrings << string.slice(index..second_index)
    end
  end
  substrings

end

def longest(string)
  substrings = substrings(string)

  substrings.select! do |substring|
    substring.chars == substring.chars.sort
  end
  
  longest = substrings.map(&:length).max
  substrings.select! do |substring|
    substring.length == longest
  end

  substrings.first
end
 
# substrings('alphabeticalllmmnop')


p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
```


# New Attempts:
def substrings(string)
  substrings = []

  string.chars.each_with_index do |char, index|

    # METHOD ONE
    # counter = index
    # loop do
    #   substrings.push(string.slice(index..counter))
    #   counter += 1
    #   break if counter >= string.length
    # end

    # METHOD 2
    # string.chars.each_with_index do |second_char, second_index|
    #   next if second_index < index
    #   # Variation on above line:
    #   #   break if index + second_index >= string.length
    #   substrings << string.slice(index..(index + second_index))
    # end

      # METHOD 3
      string[index..-1].chars.each_with_index do |second_char, second_index|
        substrings << string[index..second_index]
      end
  end
  substrings
end


p substrings('winning')

## Will Read's Answer:

# def longest(str)
#   substrings = 
#     str.length.times.map do |start|
#       #3.times.map start => [0, 1, 2]
#       (start...str.length).map do |stop|
#         #(0...3).map => [[0, 1, 2],[1, 2], [2]]
#         str[start..stop]
#       end
#     end.flatten

#   p substrings

#   # alph_substrings = 
#   #   substrings.select do |substr| 
#   #     substr == substr.chars.sort.join 
#   #   end

#   # alph_substrings.sort_by { |substr| -substr.length }[0]
# end



# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') ==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'