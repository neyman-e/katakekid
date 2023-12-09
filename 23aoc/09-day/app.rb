require_relative 'data-reader'
require_relative 'history'

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

puts next_values.sum

# Reading data from the input file
histories_input = DataReader.new(input_file)

# Generating all base subsequences
histories = []
histories_input.list.each { |history| histories << History.new(history) }

# Generating an array with the next_values for every history
next_values = []
histories.each { |history| next_values << history.next_value}

puts next_values.sum
