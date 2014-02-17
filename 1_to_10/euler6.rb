# Find the difference between the sum of the squares
# of the first one hundred natural numbers and the
# square of the sum.

sum_of_squares = (1..100).map { |n| n**2 }.reduce(:+)
square_of_sum = (1..100).reduce(:+)**2

answer = square_of_sum - sum_of_squares

puts answer
