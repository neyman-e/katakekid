require_relative 'hands-set'
require 'benchmark'

# Declaration of filenames
example_filename = 'example.txt'
input_filename = 'input.txt'

# Use Benchmark to measure the total time of the app
total_app_time = Benchmark.measure do

  example_app_time = Benchmark.measure do # Benchmark the time spent on the example
    example_hands_with_bids = HandsSet.new(example_filename)
    puts "Total winnings for the example are: #{example_hands_with_bids.winnings}"
  end
  puts "The example has taken #{(example_app_time.real * 1000).truncate(6)}ms"
  puts

  part1_app_time = Benchmark.measure do # Benchmark the time spent on part 1
    part1_hands_with_bids = HandsSet.new(input_filename)
    puts "Total winnings for part 1 are: #{part1_hands_with_bids.winnings}"
  end
  puts "Part 1 #{(part1_app_time.real * 1000).truncate(6)}ms"
  puts

  # part2_app_time = Benchmark.measure do # Benchmark the time spent on part 2
  # end
  # puts "Part2 #{(part2_app_time.real * 1000).truncate(6)}ms"
end
puts "The total execution time has been #{(total_app_time.real * 1000).truncate(6)}ms"
