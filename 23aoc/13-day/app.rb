require 'benchmark'

require_relative 'data-reader'
require_relative 'pattern'

total_time = Benchmark.measure do
  filename = 'example.txt'
  # filename = 'input.txt'
  input = DataReader.new(filename)
  pattern_notes = []
  input.data.each do |chunk|
    pattern = Pattern.new(chunk)
    pattern_notes << pattern.result
  end
  puts "The total sum of notes for every pattern is #{pattern_notes.sum}"
end
puts
puts "The total time spent in the app was #{total_time.real * 1000}ms"
