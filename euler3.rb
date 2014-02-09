# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the
# number 600851475143 ?

num = 600851475143

def is_prime?(num)
  return false if num.even?
  for i in (2..(num/2 + 1))
    return false if num % i == 0
  end
  return true
end

for n in (3..num)
  if num % n == 0
    high_factor = num / n
    break if is_prime?(high_factor)
  end
end

puts high_factor
