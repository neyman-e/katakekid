require 'benchmark'
require_relative 'data-reader'
require_relative 'history'

total_time = Benchmark.measure do
  example_file = 'example.txt'
  input_file = 'input.txt'

  # Reading data from the input file
  histories_input = DataReader.new(example_file)

  # Generating all base subsequences
  histories = []
  histories_input.list.each { |history| histories << History.new(history) }

  # Generating an array with the next_values for every history
  next_values = []
  histories.each { |history| next_values << history.next_value}

    # Generating an array with the previous_values for every history
    previous_values = []
    histories.each { |history| previous_values << history.previous_value}

    puts "The sum of the next values for the example is: #{next_values.sum}"
    puts "The sum of the previous values for the 'real' case data is: #{previous_values.sum}"

    # Reading data from the input file
    histories_input = DataReader.new(input_file)

    # Generating all base subsequences
    histories = []
    histories_input.list.each { |history| histories << History.new(history) }

    # Generating an array with the next_values for every history
    next_values = []
    histories.each { |history| next_values << history.next_value}

      # Generating an array with the previous_values for every history
  previous_values = []
  histories.each { |history| previous_values << history.previous_value}

  puts "The sum of the next values for the example is: #{next_values.sum}"
  puts "The sum of the previous values for the 'real' case data is: #{previous_values.sum}"
end

puts "The total time spent calculating all 4 sums was: #{total_time.real * 1000}ms"
