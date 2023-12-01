require 'csv'

filepath = "input.csv"

calibration_strings = []

NUMBERS = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}


# Read the CSV file into the array calibration_strings
CSV.foreach(filepath) do |row|
  calibration_strings << row[0]
end

# Return a 2 digits number with the first and last digits (integers) inside a string.
# If there's only one, that one will be both digits
def find_both_digits(string)
  first_digit = 0
  second_digit = 0

  # Iterate through all characters in the string, checking
    # if there's a number (from NUMBERS hash) a every single char position.
    # It will in fact check all NUMBERS' keys, seeing if they're contained at the specific position
  # If they are
  for char_index in 0..string.length - 1
    NUMBERS.each_pair do |key, value|
      if string.index(key, char_index) == char_index && second_digit == 0
        first_digit = value
      end
      second_digit = value if string.index(key, char_index) == char_index
    end
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
