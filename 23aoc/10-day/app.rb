require 'benchmark'

require_relative 'data-reader'
require_relative 'map'

# Substitutes the chains of characters to prepare for the even-odd method to count the polygon edges
# We substitute the 'closed sub-loop' end by an empty string
#     and the other combinations making a 'vertical S' by '|'
# These substitutions will allow us to use a boolean to know if we are inside of the loop (even outside, odd inside)
def substitutions(array)
  array.each do |line|
    line.gsub!(/(F-*7|L-*J)/,'')
    line.gsub!(/(F-*J|L-*7)/,'|')
  end
end

# As seen with the subsitutions method (previous), we count line by line, how many '.' are inside of the loop
#     by means of the boolean
def count_dots(array)
  total_dots = 0
  array.each do |line|
    inside_loop = false
    line_dots = 0
    line.chars.length.times do |index|
      char = line.chars[index]
      line_dots += 1 if inside_loop && char == '.'
      if char == '|'
        inside_loop ? inside_loop = false : inside_loop = true
      end
    end
    total_dots += line_dots
  end
  total_dots
end

# Let's check how much time the whole processing will take the app
total_time = Benchmark.measure do
  # Read input data into an array of arrays (having removed the trailing spaces)
  input_filename = 'input.txt'
  input_data = DataReader.new(input_filename)

  # Create our map
  map = Map.new(input_data.data)

  # Output for part 1
  puts "The number of steps needed to get to the furthest point is #{map.moves / 2}"

  # Let's generate an array again to perform the last calculations
  map_array = map.to_array
  substitutions(map_array)
  total_dots = count_dots(map_array)

  # Output for part 2
  puts "There are #{total_dots} tiles enclosed by the loop"
end

# Total time spent in the app
puts "The total time spent to process was #{total_time.real * 1000}ms"
