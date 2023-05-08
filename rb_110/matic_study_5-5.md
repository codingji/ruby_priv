Your task is to Reverse and Combine Words. It's not too difficult, but there are some things you have to consider...

So what to do?

Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
   (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result...

Some easy examples:

Input:  "abc def"
Output: "cbafed"

Input:  "abc def ghi 123"
Output: "defabc123ghi"

Input:  "abc def gh34 434ff 55_eri 123 343"
Output: "43hgff434cbafed343ire_55321"


SOOOO:

we are reversing every 'word' in the current list of words (starting with the input string)

then joining in pairs so indexes 1 & 2 then 3 & 4 then 5 & 6 and so on. if theres an odd number of strings, we leave it alone until the very end but continue reversing it on each iteration.

after the process is completed once we should have half as many strings (if the total starts out with an even number) and half plus one string (if there is an odd number)

on the next iteration we repeat the above process on the output from the first iteration (rather than the orginal input string). so on every pass through the string object, we modify it by reversing and joining pairs until there is only 1 string left, then return that string.

Problems:
- break apart string object into 'words'
  - (split)
- reverse every word in the 'split array'
  - (reverse)
- join pairs of 'words' and leave last 'word' unpaired when there is an odd number of 'words'
  - join 2 shifted 'words' from current array and push to a new array
- repeat the above 2 steps until the entire orginal split array has been combined into one long 'word'
- return that long word

```ruby
def reverse_and_combine_text(string)
  words = string.split(' ')
  if words.size == 1
    return string
  else
    loop do
    # Reverse each word in words:
      words.map! do |word|
        word.reverse
      end

      # Join Pairs of 'words':
      new_array = []
      
      while words.size > 0
      new_array << words.shift(2).join
      end
      # Reassigning words to the new version for use in next iteration:
      words = new_array

      # Break when all words have been combined into 1:
      break if words.size <= 1
    end

    # Using join to convert the array object to a string:
    # words.join
    # OR
    words.to_s
  end
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"

```

```ruby
def word(array)
  array.map.with_index { |word, idx| word[idx] }.join
end

words = ['yo', 'mama', 'elephant']

p word(words)
```