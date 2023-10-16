# *************** #
#                 #
#   Kata's URL    #
#                 #
# *************** #

# https://www.codewars.com/kata/52c31f8e6605bcc646000082/ruby

# *************** #
#                 #
#   Instructions  #
#                 #
# *************** #

# Write a function that takes an array of numbers (integers for the tests) and a target number.
# It should find two different items in the array that, when added together, give the target value.
# The indices of these items should then be returned in a tuple / list (depending on your language)
#   like so: (index1, index2).

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers;
#   target will always be the sum of two different items from that array).

# Based on: http://oj.leetcode.com/problems/two-sum/

# two_sum([1, 2, 3], 4) == {0, 2}

def two_sum(numbers, target)
  index1 = 0
  index2 = 1

  # As we know we will always get valid solutions...
  # Let's loop double the whole array.
  # The inner loop goes until the second index reaches the array's end.
  # If it does, the outer loop increments both indexes to avoid checking possible solutions more than once.

  loop do
    until index2 == numbers.length
      return [index1, index2] if numbers[index1] + numbers[index2] == target

      index2 += 1
    end
    index1 += 1
    index2 = index1 + 1
  end
end

# *************** #
#                 #
#      Tests      #
#                 #
# *************** #

# Test.assert_equals(two_sum([1, 2, 3], 4).sort, [0, 2])
# Test.assert_equals(two_sum([1234, 5678, 9012], 14690).sort, [1, 2])
# Test.assert_equals(two_sum([2, 2, 3], 4).sort, [0, 1])
