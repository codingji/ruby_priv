def palindrome?(string)
  string.length > 0 &&
  string.chars == string.chars.reverse
end


# p palindrome?('cat')
# p palindrome?('dopapod')
# p palindrome?('tat')
# p palindrome?('t')
# p palindrome?('')

def substrings(str)

end


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