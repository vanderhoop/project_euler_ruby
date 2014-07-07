# Each new term in the Fibonacci sequence is generated by
# adding the previous two terms. By starting with 1
# and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence
# whose values do not exceed four million, find the
# sum of the even-valued terms.
#================================================


#=======================
# non-recursive solution
#=======================

def fibonacci_builder(limit)
  fibonacci_sequence= [1,2]
  new_fib_number = 0
  while new_fib_number < limit
    last_num = fibonacci_sequence[-1]
    second_last_num = fibonacci_sequence[-2]
    new_fib_number = last_num + second_last_num
    fibonacci_sequence.push(new_fib_number)
  end
  return fibonacci_sequence
end

fib_to_4_mil = fibonacci_builder(4_000_000)
answer = fib_to_4_mil.select(&:even?).reduce(:+)

puts answer

#=======================
# recursive solution
#=======================
fibonnaci_sequence_array = [1,2]

def fibonacci_builder_recursive(arr, limit)
  new_num = arr[-1] + arr[-2]
  if new_num > limit                  # base case
    return arr
  else                                # recursive case
    arr.push(new_num)
    fibonacci_builder_recursive(arr, 4_000_000)
  end
end

fib_to_4_mil = fibonacci_builder_recursive(fibonnaci_sequence_array, 4_000_000)
answer = fib_to_4_mil.select(&:even?).reduce(:+)

puts answer
