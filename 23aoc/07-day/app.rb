require_relative 'data-parser'
require_relative 'hands-set'
require 'benchmark'

# Use Benchmark to measure the total time of the app
total_app_time = Benchmark.measure do

  example_app_time = Benchmark.measure do

  end
  puts "The example has taken #{example_app_time.real * 1000}ms"
  # part1_app_time = Benchmark.measure do
  # end
  # puts "Part 1 #{part1_app_time.real * 1000}ms"
  # part2_app_time = Benchmark.measure do
  # end
  # puts "Part2 #{part2_app_time.real * 1000}ms"
end
puts "The total execution time has been #{total_app_time.real * 1000} miliseconds"
