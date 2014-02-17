require 'pry'

counter = 2

collatz_sequences = []

while counter < 1_000_000 do
  puts counter
  num = counter
  arr = [num]
  while num != 1 do
    # begin sequence list with the number in question
    num = num.even? ? num/2 : num*3 + 1
    arr.push(num)
  end
  collatz_sequences.push(arr)
  counter += 1
end

sequences_by_length = collatz_sequences.sort_by { |a| a.length }
answer = sequences_by_length.last.first
puts answer


