require 'benchmark'

require_relative 'data-reader'
require_relative 'pattern'
require_relative 'smudge-pattern'

total_time = Benchmark.measure do
  filename = 'example.txt'
  filename = 'input.txt'
  input = DataReader.new(filename)
  pattern_notes = []
  smudge_pattern_notes = []
  input.data.each do |chunk|
    pattern = Pattern.new(chunk)
    pattern_notes << pattern.result
    smudge_pattern = SmudgePattern.new(chunk)
    smudge_pattern_notes << smudge_pattern.result
  end
  puts "Part1: #{pattern_notes.sum} is the total sum of notes for every pattern."
  puts "Part2: #{smudge_pattern_notes.sum} is the total sum of notes for every pattern with only 1 smudge"
end
puts
puts "The total time spent in the app was #{total_time.real * 1000}ms"
