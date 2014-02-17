require 'pry'

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

def is_prime?(num)
  return false if num.even?
  for i in (2..((num/2.round) + 1))
    return false if num % i == 0
  end
  return true
end

primes_under_two_mil = []

(1...2_000_000).step(2).each do |n|
  if is_prime?(n)
    puts n
    primes_under_two_mil << n
  end
end

answer = primes_under_two_mil.reduce(:+)

binding.pry
