require 'benchmark'

require_relative 'data-reader'
require_relative 'parabolic-dish'

total_time = Benchmark.measure do
  filename = 'example.txt'
  # filename = 'input.txt'
  data_input = DataReader.new(filename)
  data_input.data.each{puts _1.join}
end
puts "The total time spent in the app was #{total_time.real * 1000}ms"
