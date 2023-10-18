# Kata's URL
[Break the Caesar!](https://www.codewars.com/kata/598e045b8c13926d8c0000e8/ruby)

# Instructions
The Caesar cipher is a notorious (and notoriously simple) algorithm for encrypting a message: each letter is shifted a certain constant number of places in the alphabet. For example, applying a shift of `5` to the string `"Hello, world!"` yields `"Mjqqt, btwqi!"`, which is jibberish.

In this kata, your task is to decrypt Caesar-encrypted messages using nothing but your wits, your computer, and a `set` of the 1000 (plus a few) most common words in English in **lowercase** (made available to you as a preloaded variable named `WORDS`, which you may use in your code as if you had defined it yourself).

### Given a message, your function must return the most likely shift value as an integer.

A few hints:

- Be wary of punctuation
- Shift values may not be higher than 25

# Tests

```ruby
describe "Break the Ceasar!" do
  it "Basic tests" do
    Test.assert_equals(break_caesar("DAM?"), 7)
    Test.assert_equals(break_caesar("Mjqqt, btwqi!"), 5)
    Test.assert_equals(break_caesar("DAM? DAM! DAM."), 7)
    Test.assert_equals(break_caesar("Gur dhvpx oebja sbk whzcf bire gur ynml qbt."), 13)
  end
end
```
