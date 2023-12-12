require 'benchmark'

require_relative 'data-reader'

app_time = Benchmark.measure do
  # Reading data from file name with data reader class
  filename = 'input.txt'
  data_input = DataReader.new(filename)

  # Printing out data for checkup
  first_col_width = 20
  second_col_width = 20
  data_input.groups.size.times do |index|
    printf("%-#{first_col_width}s%#{second_col_width}s\n", data_input.springs_info[index], data_input.groups[index].inspect)
  end
end

puts "The total time spent on the app was #{app_time.real * 1000}ms"
