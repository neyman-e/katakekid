# https://www.codewars.com/kata/58f6024e1e26ec376900004f/ruby

# In this Kata you have to find the factors of integer down to the limit including the limiting number. There will be no negative numbers. Return the result as an array of numbers in ascending order.

# If the limit is more than the integer, return an empty list

# As a challenge, see if you can do it in one line

def factors(integer, limit)
  # 1st we create an array with all the integers from the limit until the integer we want to factorize
  # 2nd we select all the ones that return modulo equal to 0 when they divide the integer we are factorizing
  (limit..integer).to_a.select { |element| integer % element == 0 }
end

# describe "Basic Tests" do
#   Test.assert_equals(factors(5, 1), [1, 5])
#   Test.assert_equals(factors(30, 2), [2, 3, 5, 6, 10, 15, 30])
#   Test.assert_equals(factors(100, 75), [100])
#   Test.assert_equals(factors(40, 5), [5, 8, 10, 20, 40])
#   Test.assert_equals(factors(1, 5), [])
# end
