# A Pythagorean triplet is a set of three natural
# numbers, a < b < c, for which a2 + b2 = c2

# There exists exactly one Pythagorean triplet for
# which a + b + c = 1000. Find the product abc.

pythag_triplets = []
# find cases where c squared is equal to the sum of two lesser integers squared
for i in 999.downto(1)
  next_lowest_int = i - 1
  for n in next_lowest_int.downto(1)
    next_lowest_int = n - 1
    for x in next_lowest_int.downto(1)
      pythag_triplets << [x, n, i] if x**2 + n**2 == i**2
    end
  end # for n
end # for i

# finds lone case where a pythagorean triplet, summed, equals 1000.
where_sum_1000 = pythag_triplets.find do |arr|
                   arr[0] + arr[1] + arr[2] == 1000
                 end

answer = where_sum_1000.reduce(:*)
puts answer



