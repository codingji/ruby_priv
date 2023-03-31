```ruby
def fix(value) 
  value = value.upcase! 
  value.concat('!')
end

s = 'hello' # Same object_id
t = fix(s)  # Same object_id

# 

def fix(value) 
  value = value.upcase # Reassigning value to the return of calling `upcase` on the existing value of `value`. =>
  value.concat('!') # This is a new object_id with the same name `value` => mutates the new value object => 'HELLO!'
end

s = 'hello'
t = fix(s) # assign `t` to the return value of the call to `fix`


```

- This method has one parameter. (After this point do not refer to value as a parameter, refer to it as a local method variable)

