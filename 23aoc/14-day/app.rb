require 'benchmark'

require_relative 'data-reader'
require_relative 'parabolic-dish'

total_time = Benchmark.measure do
  filename = 'example.txt'
  # filename = 'input.txt'
  data_input = DataReader.new(filename)
  parabolic_dish = ParabolicDish.new(data_input.data)
end
puts "The total time spent in the app was #{total_time.real * 1000}ms"
