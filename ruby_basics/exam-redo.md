# 1

Assume we have the following program:

```ruby
array = [2, 4, 6, 8]

# Can add code here

index = 0
loop do
  puts (array[index] - 2)
  another_num = array[index] - 2
  index += 1
  break if (array.size) == index
end

puts another_num
```

We expect that this program will following output:
```ruby
0
2
4
6
6
```

Unfortunately, it's not working. What do we get instead, and why? Fix the example by adding code on line 3. Explain why your solution works. What concept does this demonstrate?

---

# 2 
​Explain precisely what the following code outputs and why. Explain two differences about using a for loop in this question and a loop in the previous question?

```ruby
array = [2, 4, 6, 8]

for num in array do
  puts num
  a_num = num
end

puts a_num
```

---

# 3
What is the output of the following code? Explain why this is the output. What code could you add on line 1 so that the code outputs Jilly Bean? Why does your solution fix the problem?

```ruby
# Can add code here

1.times do
  name = "Jilly Bean"
end

1.times do
  puts name
end
```

---

# 4
​Rebekah likes her name very much. Every time anyone says it, she wants them to say her full name: first, middle and last. She works on some code to help her. Explain with reference to nested scopes why this code raises an error. Fix Rebekah's code so that it prints her full name still using nested scopes.
```ruby
first = "Rebekah"
loop do
  middle = "Lauren"
  loop do
    last = "Stokes"
    break
  end
  puts "Full name:"
  puts first + " " + middle + " " + last
  break
end
```

---

# 5
In your own words, explain the concept of Variable Shadowing. As part of your explanation, include a code snippet that accurately demonstrates variable shadowing, and explain the effect that variable shadowing has within that example. (Note: do not copy and paste an explanation or example from the text).

---

# 6
When Alice went down the rabbit hole she grew much bigger than she was normally. She wanted to show her friends just how big she grew by writing the method bigger, which takes her current height as an argument and makes it bigger. Unfortunately, Alice is having trouble getting the bigger method working and is experiencing unexpected bugs in her code. She was expecting lines 8, 10, and 12 to output 108.0, but that’s not what is happening. Explain what is occurring on lines 8, 10, and 12 and why. What concept does this illustrate?

```ruby
CAKE_MULTIPLIER = 2.16 # more then double to get to 9 ft (== 108 in) tall

def bigger(height)
  bigger_height = height * CAKE_MULTIPLIER
end

alice_height = 50 #ft
p bigger(alice_height)

p bigger_height

p alice_height
```

---

# 7
​ Alice's friend Jack has also started learning Ruby. He wants to use her code for a project. He has decided it is time to face the giant. Without the magic beans, he needs to plan how big he has to make his bean stalks to get back to the giant's lair. He came up with the following code that uses the method #doubler to make bigger strings. However, the code doesn't work as expected. Why is the plant doubled on line 6 but not on line 8? What concept does this illustrate? What are string and plant in this code? What is the relationship between them?

```ruby
def doubler(string)
  string + string
end

plant = "string bean"
p doubler(plant)    # prints "string beanstring bean"

p plant             # prints "string bean"

```

---

# 8 
​Learning from his mentors and teammates that persistence is key to learning how to code, Jack tries again. He shows you this code and explains that by saving the double string to itself that now it will make his "string bean" bigger. How do you explain to Jack why the code on line 8 outputs "string bean" instead of "string beanstring bean"? Why didn't changing line 2 fix the problem? What concept does this illustrate?

```ruby
def doubler(string)
  string = string + string
end

plant = "string bean"
p doubler(plant)    # prints "string beanstring bean"

p plant             # still prints "string bean"
```

---

# 9
​Jack decided to ask Belle and Stack Exchange for help in order to fix the code. Why is the output in this code example different then the previous problems? What is the relationship between plant and string in this example?

```ruby
def doubler(string)
  string << string
end

plant = "string bean"
p doubler(plant)

p plant
```

---

# 10

In this question, you are going to be defining two versions of a method that accepts an array as an argument and returns the same array with the final element of the array deleted. Version 1 of this method should mutate the array that is passed into it as an argument, while Version 2 should not mutate the array that is passed in as an argument.

Test case for Version 1:

```ruby
def mutating_delete(arr)
  #your code goes here
end

arr = [1, 2, 3]

mutating_delete(arr) == [1, 2] #=> true
arr == [1, 2] #=> true
```

Test case for Version 2:

```ruby
def non_mutating_delete(arr)
  #your code goes here
end

arr = [1, 2, 3]

non_mutating_delete(arr) == [1, 2] #=> true
arr == [1, 2, 3] #=> true
```

---