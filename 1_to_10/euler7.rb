# listing the first six prime nums: 2, 3, 5, 7, 11, & 13,
# we can see that the 6th prime is 13.

# What is the 10,001st prime number?

def is_prime?(num)
  return false if num.even?
  for i in (2..((num/2.round) + 1))
    return false if num % i == 0
  end
  return true
end

primes = [2, 3, 5, 7, 11, 13]
eval_num = 15
until primes.size > 10_000
  primes << eval_num if is_prime?(eval_num)
  eval_num += 2
end

answer = primes.last
puts answer
