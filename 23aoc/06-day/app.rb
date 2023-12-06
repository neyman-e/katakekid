require_relative 'data-parser'
require_relative 'race-math'

filename1 = "example.txt"
filename2 = "input.txt"

# Let's parse all data from the 2 files and for the 3 cases (example, part1 and part2)
data1 = DataParser.new(filename1, "Part1")
example_race_records = data1.clean_race_records
data1 = DataParser.new(filename2, "Part1")
part1_race_records = data1.clean_race_records
data1 = DataParser.new(filename2, "Part2")
part2_race_records = data1.clean_race_records

# Initialize our math class
math = RaceMath.new

puts "The result for the example is #{math.calculate_result(example_race_records)}"
puts "The result for part 1 is #{math.calculate_result(part1_race_records)}"
puts "The result for part 2 is #{math.calculate_result(part2_race_records)}"
