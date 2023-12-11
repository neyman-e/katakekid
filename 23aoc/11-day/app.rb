require 'benchmark'

require_relative 'data'
# require_relative 'map'

# Let's check how much time the whole processing will take the app
total_time = Benchmark.measure do
  # Read input data and perform calculations with the Data class
  input_filename = 'input.txt'
  expanded_space_map = Data.new(input_filename)
  puts "The sum of all distances between all galaxies is #{expanded_space_map.distances_between_galaxies.sum}"
end

# Total time spent in the app
puts "The total time spent to process was #{total_time.real * 1000}ms"
