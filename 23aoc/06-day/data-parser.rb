class DataParser
  attr_reader :clean_race_records

  # Init (Parts 1 and 2)
  def initialize(filename, part)
    @race_inputs = {}
    @clean_race_records = []
    @filename = filename
    read_data if File.exist?(@filename)
    part == "Part1" ? convert_data_part1 : convert_data_part2
  end

  private

  # Read the data from the file and leave it ready with 2 arrays which are included in the array @race_inputs
  # (Parts 1 and 2)
  def read_data
    data = File.open(@filename)
    lines = []
    data.each { |line| lines << line }
    race_times = lines[0].strip.split(/[a-zA-z\s:]+/)
    distance_challenges = lines[1].strip.split(/[a-zA-z\s:]+/)
    race_times.shift
    distance_challenges.shift
    @race_inputs = [race_times, distance_challenges ]
  end

  # Group the data properly in hashes for each race inside of an array (Parts 1 and 2)
  def group_arrays(array1, array2)
    new_array = []
    array1.each_index do |index|
      new_array << { race_time: array1[index], distance_challenge: array2[index] }
    end
    new_array
  end

  # Specific conversion for the multiple race entries (Part 1 -and example-)
  def convert_data_part1
    @race_inputs = [@race_inputs[0].map { |number| number.to_i }, @race_inputs[1].map { |number| number.to_i }]
    @clean_race_records = group_arrays(@race_inputs[0], @race_inputs[1])
  end

  # Specific conversion for the 1 single race entry (Part 2)
  def convert_data_part2
    @clean_race_records = group_arrays([@race_inputs[0].join.to_i], [@race_inputs[1].join.to_i])
  end
end
