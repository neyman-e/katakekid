require_relative 'almanac'

almanac = Almanac.new('input.txt')
almanac.output_almanac

puts almanac.lowest_location
