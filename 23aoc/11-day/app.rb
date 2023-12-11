require 'benchmark'

require_relative 'data'
# require_relative 'map'

# Let's check how much time the whole processing will take the app
total_time = Benchmark.measure do
  # Read input data into an array of arrays (having removed the trailing spaces)
  input_filename = 'input.txt'
  expanded_space_map = Data.new(input_filename)
  # expanded_space_map.expanded_space_universe.each{ |line| puts line.join}

  # Create our map
  # map = Map.new(input_data.data)

  # # Output for part 1
  # puts "The number of steps needed to get to the furthest point is #{map.moves / 2}"

  # # Let's generate an array again to perform the last calculations
  # map_array = map.to_array
  # substitutions(map_array)
  # total_dots = count_dots(map_array)

  # # Output for part 2
  # puts "There are #{total_dots} tiles enclosed by the loop"
end

# Total time spent in the app
puts "The total time spent to process was #{total_time.real * 1000}ms"
