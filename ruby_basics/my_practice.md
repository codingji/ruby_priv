## Show two different ways to put the expected 'Four score and ' in front of `famous_words = "seven years ago..."`.

```ruby
famous_words = "seven years ago..."
p "famous_words.object_id: #{famous_words.object_id}"

# famous_words.prepend('Four score and ')
# OR
# famous_words.sub!(famous_words, 'Four score and ' + famous_words)
# OR
# famous_words = 'Four score and ' << famous_words

p famous_words
p "famous_words.object_id: #{famous_words.object_id}"

```


## See if 'Spot' is present in the hash in 3 ways:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

#Ans:

ages.include?('Spot')
ages.select {|key,val| key == 'Spot'}.length > 0
ages.has_key?('Spot')
ages['Spot'] != `nil`
ages.key?("Spot")
ages.member?("Spot")
```

## Convert this
`munsters_description = "The Munsters are creepy in a good way."`

```ruby
munsters_description = "The Munsters are creepy in a good way."

# to this:
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

#Ans:

p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!
```

## Add the second has to the first:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

p ages # => {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}
```

## Find out if the string 'dino' is in the following string object.

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice('dino') != nil
p advice.sub('dinot', 'cat') == advice
p advice.match?('dino')
p advice.match('dino') != nil
p advice.scan('dino').any?
p advice =~ /dino/

p advice.slice('Dino') != nil
p advice.sub('Dino', 'cat') != advice
p advice.match?('Dino')
p advice.match('Dino') != nil
p advice.scan('Dino').any?
p (advice =~ /Dino/) != nil
```

## Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

# p advice.slice!('Few things in life are as important as ')
# p advice.slice!(0..38)
# p advice.slice!(0, 39)
p advice.slice!(0, advice.index('house'))

p advice
```

## Write a one-liner to count the number of lower-case 't' characters in the following string:

`statement = "The Flintstones Rock!"`

`p statement.count('t')`

