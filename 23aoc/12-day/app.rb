require 'benchmark'

require_relative 'data-reader'
require_relative 'record'

app_time = Benchmark.measure do
  # Reading data from file name with data reader class
  filename = 'example.txt'
  data_input = DataReader.new(filename)

  # Printing out data for checkup
  first_col_width = 20
  second_col_width = 20
  total_possibilities = []
  data_input.groups.size.times do |index|
    record = Record.new(data_input.springs_info[index], data_input.groups[index])
    puts "Spring #{index + 1}:"
    printf(
      "%-#{first_col_width}s%#{second_col_width}s\n",
      data_input.springs_info[index],
      data_input.groups[index].inspect,
    )
    puts "#{record.no_dots} - Removed extra dots ('.')"
    puts "#{record.ideal_case} - Ideal case"
    puts "#{record.pending_chars} pending chars"
    total_possibilities << record.possibilities
    puts
    puts
  end
  puts "Total amount of possibilites is #{total_possibilities.sum}"
end

puts "The total time spent on the app was #{app_time.real * 1000}ms"
