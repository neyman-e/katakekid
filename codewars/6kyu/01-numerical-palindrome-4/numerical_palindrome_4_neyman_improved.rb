# https://www.codewars.com/kata/58df8b4d010a9456140000c7/ruby

# A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward. Examples of numerical palindromes are:

# 2332
# 110011
# 54322345

# For a given number num, return its closest numerical palindrome which can either be smaller or larger than num. If there are 2 possible values, the larger value should be returned. If num is a numerical palindrome itself, return it.

# For this kata, single digit numbers will NOT be considered numerical palindromes.

# Also, you know the drill - be sure to return "Not valid" if the input is not an integer or is less than 0.

# palindrome(8) => 11
# palindrome(281) => 282
# palindrome(1029) => 1001
# palindrome(1221) => 1221
# palindrome("1221") => "Not valid"
# Other Kata in this Series:
# Numerical Palindrome #1
# Numerical Palindrome #1.5
# Numerical Palindrome #2
# Numerical Palindrome #3
# Numerical Palindrome #3.5
# Numerical Palindrome #4
# Numerical Palindrome #5

def palindrome(num, i = 0)
  # Break if the parameter is not valid
  return "Not valid" unless num.is_a?(Integer) and num.positive?

  # Avoid any operations below 10
  return 11 if num < 11

  # Repeatedly check if the number reads the same backwards and forwards
  loop do
    return (num + i) if (num + i) == (num + i).digits.join.to_i
    return (num - i) if (num - i) == (num - i).digits.join.to_i
    i += 1
  end
end

# Test.assert_equals(palindrome(8),11,"'8' should return '11'")

# Test.assert_equals(palindrome(281),282,"'281' should return '282'")

# Test.assert_equals(palindrome(1029),1001,"'1029' should return '1001'")

# Test.assert_equals(palindrome(1221),1221,"'1221' should return '1221'")

# Test.assert_equals(palindrome("BGHHGB"),"Not valid","'BGHHGB' should return 'Not valid'")

# Test.assert_equals(palindrome("11029"),"Not valid","'\"11029\"' should return 'Not valid'")

# Test.assert_equals(palindrome(-1029),"Not valid","'-1029' should return 'Not valid'")
