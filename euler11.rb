require 'pry'

# What is the greatest product of four adjacent
# numbers in the same direction (up, down, left,
# right, or diagonally) in the 20×20 grid?
# indices:   0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
str_grid = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08 " +
#           20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39
           "49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
            81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
            52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
            22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
            24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
            32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
            67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
            24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
            21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
            78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
            16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
            86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
            19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
            04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
            88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
            04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
            20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
            20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
            01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48" # 399, 379, 359
# 380, 360, 340

# I want to turn the grid into an array_of_integers
grid_as_str_arr = str_grid.split(" ")
grid_as_int_arr = grid_as_str_arr.map(&:to_i)

def hor_line_terminates?(index, direction)
  if direction == "right"
    range_start, range_end = 17, 19
    20.times do
      return true if index.between?(range_start, range_end)
      range_start += 20
      range_end += 20
    end
    return false
  end
  if direction == "left"
    # I want to handle diagonal cases where line_terminates
    # to the left
    range_start, range_end = 0, 2
    20.times do
      return true if index.between?(range_start, range_end)
      range_start += 20
      range_end += 20
    end
    return false
  end
end

def vert_line_terminates?(index)
  index >= 340 ? true : false
end
# I want to progress through the array, multiplying each
# set of 4 numbers appearing side by side

highest_product = 0

# handles horizontal sequences
grid_as_int_arr.each_with_index do |num, i|
  p1, p2, p3 = grid_as_int_arr[i+1], grid_as_int_arr[i+2], grid_as_int_arr[i+3]
  # if p1, p2, or p3 are nil values (end of grid), cont.
  next if hor_line_terminates?(i, "right")
  product = num * p1 * p2 * p3
  highest_product = product if product > highest_product
end

# handles vertical sequences
grid_as_int_arr.each_with_index do |num, i|
  next if vert_line_terminates?(i)
  p1, p2, p3 = grid_as_int_arr[i+20], grid_as_int_arr[i+40], grid_as_int_arr[i+60]
  product = num * p1 * p2 * p3
  highest_product = product if product > highest_product
end

# handles diagonal sequences both right and left
grid_as_int_arr.each_with_index do |num, i|
  next if vert_line_terminates?(i)
  # diagonal nums to right
  unless hor_line_terminates?(i, "right")
    dr1, dr2, dr3 = grid_as_int_arr[i + 21], grid_as_int_arr[i + 42], grid_as_int_arr[i + 63]
    r_product = num * dr1 * dr2 * dr3
    highest_product = r_product if r_product > highest_product
  end
  # diagonal nums to left
  unless hor_line_terminates?(i, "left")
    dl1, dl2, dl3 = grid_as_int_arr[i + 19], grid_as_int_arr[i + 38], grid_as_int_arr[i + 57]
    l_product = num * dl1 * dl2 * dl3
    highest_product = l_product if l_product > highest_product
  end
end

answer = highest_product
