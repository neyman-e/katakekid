# Kata's URL
https://www.codewars.com/kata/55f4e56315a375c1ed000159

# Instructions
The number 81 has a special property, a certain power of the sum of its digits is equal to 81 (nine squared). Eighty one (81), is the first number in having this property (not considering numbers of one digit). The next one, is 512. Let's see both cases with the details

8 + 1 = 9 and 92 = 81

512 = 5 + 1 + 2 = 8 and 83 = 512

We need to make a function that receives a number as argument `n` and returns the `n-th term` of this sequence of numbers.

### Examples (input --> output)

```
1 --> 81

2 --> 512
```

Happy coding!

# Tests
```
describe("power_sumDigTerm") do
  it("Basic tests") do
    Test.assert_equals(power_sumDigTerm(1), 81)

    Test.assert_equals(power_sumDigTerm(2), 512)

    Test.assert_equals(power_sumDigTerm(3), 2401)

    Test.assert_equals(power_sumDigTerm(4), 4913)

  end
end
```
