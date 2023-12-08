require_relative 'hands-set'
require 'benchmark'

# Declaration of filenames & type of data (using part 1 or part 2)
# Part 1: J's are ordinary jacks (another card)
# Part 2: J's are jokers (can complete a better ranked hand but break tied hands with the lowest rank)
example_filename = 'example.txt'
input_filename = 'input.txt'

# Use Benchmark to measure the total time of the app
total_app_time = Benchmark.measure do

  j_is_joker = true # We use it for part 1
  example_app_time = Benchmark.measure do # Benchmark the time spent on the example
    example_hands_with_bids = HandsSet.new(example_filename, j_is_joker)
    puts "Total winnings for the example with J's being ordinary Jacks are: #{example_hands_with_bids.winnings}"
  end
  puts "The example has taken #{(example_app_time.real * 1000).truncate(6)}ms"
  puts

  part1_app_time = Benchmark.measure do # Benchmark the time spent on part 1
    part1_hands_with_bids = HandsSet.new(input_filename, j_is_joker)
    puts "Total winnings for part 1 input (with J's being ordinary Jacks) are: #{part1_hands_with_bids.winnings}"
  end
  puts "Part 1 #{(part1_app_time.real * 1000).truncate(6)}ms"
  puts

  j_is_joker = false # We use it for part 2
  example_app_time_with_jokers = Benchmark.measure do # Benchmark the time spent on the example
    example_hands_with_bids = HandsSet.new(example_filename, j_is_joker)
    puts "Total winnings for the example with J's being jokers are: #{example_hands_with_bids.winnings}"
  end
  puts "The example with J's being jokers has taken #{(example_app_time_with_jokers.real * 1000).truncate(6)}ms"
  puts

  part2_app_time = Benchmark.measure do # Benchmark the time spent on part 1
    part2_hands_with_bids = HandsSet.new(input_filename, j_is_joker)
    puts "Total winnings for part 2 input (with J's being jokers) are: #{part2_hands_with_bids.winnings}"
  end
  puts "Part 2 #{(part2_app_time.real * 1000).truncate(6)}ms"
  puts
end
puts "The total execution time has been #{(total_app_time.real * 1000).truncate(6)}ms"
