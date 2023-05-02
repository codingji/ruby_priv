##=====MOCK PRECISE READTHRU

# # 1 ---

# def mew_tent(yarn = 'wool')
#   new_yarn_ball = ''
#   capn = true

#   for thread in yarn.chars do
#     if capn
# 	    new_yarn_ball.concat(thread.upcase)
# 	  else
# 	    new_yarn_ball.concat(thread.downcase)
# 	  end

#     capn = !capn
#   end
#   yarn
# end


# p mew_tent('lowercase')
# p mew_tent('UPPERCASE')


# # 2 ---
# boolean negat
# 5 * 


# ##=====BEGIN MOCK INTERVIEW
# 1 ---

# a = [1, 3]
# b = [2]
# arr = [a, b]
# arr

# a[1] = 5
# arr


# ====================
# 2a---

# def fix(value)
#   value.upcase!
#   value.concat('!')
#   value
# end

# s = 'hello'
# t = fix(s)

# Both pointing to same object?
# Be mutated as well (could imply
# Pass by reference value
# copies of references passed in
# #2b ---

# def fix(value)
#   value = value.upcase
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)


# #2c---

# def fix(value)
#   value << 'xyz'
#   value = value.upcase
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)


# #2d---

# def fix(value)
#   value = value.upcase!
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)


# =====================
# 3 ---

# a = %w(a b c)
# a[1] = '-'
# p a

# []= method? what do i call this
# ====================
# 4---

# def add_name(arr, name)
#   arr = arr << name
# end

# names = ['bob', 'kim']
# add_name(names, 'jim')
# puts names

# p a.object_id
# =====================
# 5a---
# return exits the program
# def meal
#   return 'Breakfast'
# end

# puts meal

# #5b ---

# def meal
#   'Evening'
# end

# puts meal

# #5c ---

# def meal
#   return 'Breakfast'
#   'Dinner'
# end

# puts meal

# #5d ---

# def meal
#   puts 'Dinner'
#   return 'Breakfast'
# end

# puts meal

# #5e ---

# def meal
#   'Dinner'
#   puts 'Dinner'
# end

# p meal

# #5e ---

# def meal
#   return 'Breakfast'
#   'Dinner'
#   puts 'Dinner'
# end

# puts meal

# ====END

# a = %w(a b c)

# p a[1].object_id

# p a.object_id
# a[1] << '-'
# a[1].delete('b')
# p a.object_id
# p a[1].object_id

# p a
num = 12

p num < 4 || num > 8 && num < 10 || num > 16