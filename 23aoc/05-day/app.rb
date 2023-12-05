require_relative 'almanac'

# Initialize our input by calling the correct file
almanac = Almanac.new('input.txt')

# Solutions' output:
puts "The lowest location corresponding to one of the initial seeds is #{almanac.lowest_location} (Part 1)"
puts "The lowest location corresponding to the seed ranges given is #{almanac.part2_lowest_location} (Part 2)"
