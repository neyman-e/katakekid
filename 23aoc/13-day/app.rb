require 'benchmark'

require_relative 'data-reader'
require_relative 'pattern'

total_time = Benchmark.measure do
  filename = 'example.txt'
  # filename = 'input.txt'
  input = DataReader.new(filename)
  # input.data.each { |pattern| p pattern ; puts}
  input.data.each do |chunk|
    pattern = Pattern.new(chunk)
  end
end
puts
puts "The total time spent in the app was #{total_time.real * 1000}ms"
