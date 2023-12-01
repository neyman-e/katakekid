require 'csv'

filepath = "input.csv"

calibration_strings = []

# Read the CSV file into the array calibration_strings
CSV.foreach(filepath) do |row|
  calibration_strings << row[0]
end

# Return a 2 digits number with the first and last digits (integers) inside a string.
# If there's only one, that one will be both digits
def find_both_digits(string)
  first_digit = 0
  second_digit = 0

  # Iterate through all characters in the string, checking if they're Integer
  string.chars.each do |char|
    first_digit = char.to_i if !(char.to_i == 0) && second_digit == 0
    second_digit = char.to_i if !(char.to_i == 0)
  end

  #return the 2 digits number
  first_digit * 10 + second_digit
end

calibration_values = []

# Iterate through the whole words list, calculating the 2 digits number for each line
calibration_strings.each do |word|
  calibration_values << find_both_digits(word)
end

# Output the total sum
puts calibration_values.sum
