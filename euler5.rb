# 2520 is the smallest number that can be divided by
# each of the numbers from 1 to 10 without a remainder.

# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

#==============================================
# I want to increment the number I'm checking by 20
# unless the number is divisible by all numbers from
# one to twenty

def check_divisibility(num)
  for i in 1..20
    return false if num % i != 0
  end
  return true
end

num = 2520
until check_divisibility(num)
  num += 20
end

answer = num
puts answer
