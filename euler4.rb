# Find largest palindrome made from the product of two
# 3-digit numbers.

def is_palindromic?(num)
  num_str = num.to_s
  length = num_str.length
  return false if length.odd?
  first_half = num_str[0..length / 2 - 1]
  second_half = num_str[length / 2..-1]
  return true if first_half == second_half.reverse
  return false
end

palindromes = []
for i in 999.downto(100)
  for t in 999.downto(100)
    palindromes.push(i*t) if is_palindromic?(i*t)
  end
end

answer = palindromes.max
puts answer
