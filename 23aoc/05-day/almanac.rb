require_relative 'map'

class Almanac
  attr_reader :seeds

  # Global variable array which will allow us to iterate through all maps without repeating code
  MAPS_NAMES = ["seed-to-soil", "soil-to-fertilizer", "fertilizer-to-water",
    "water-to-light", "light-to-temperature", "temperature-to-humidity",
    "humidity-to-location"]

  def initialize(input_file)
    @input_file = input_file
    @seeds = []
    @extended_seeds = []

    # Initializing all maps (instance variables) with our list of map names
    MAPS_NAMES.each do |map_name|
      instance_variable_set("@#{substitute_dashes_to_underscores(map_name)}", Map.new(map_name))
    end

    read_almanac if File.exist?(@input_file)
  end

  # Returns the lowest of the locations once all seeds have been mapped to their locations
  def lowest_location
    locations.min
  end

  def part2_lowest_location
    50000000000.times do |location|
      location += 23738610
      return location if location_in_seeds?(location)
    end
    "not found"
  end

  private

  # Reads the input file into the maps (instance variables) and calculates the calculation ranges
  def read_almanac
    # Load the file into an array of strings
    input_content = []
    input = File.open(@input_file)
    input.each { |line| input_content << line.to_s.chomp }

    # Read the seeds numbers from 1st line
    @seeds = numbers_to_array(input_content[0].gsub('seeds: ', ''))
    read_maps_data(input_content)
    Map.calculate_ranges
    calculate_extended_seeds
  end

  # Splits the numbers separated with ' ' in a string and converts them to integers
  def numbers_to_array(string)
    string.split.map { |number| number.to_i }
  end

  # True if a line contains the text "map:", false otherwise
  def map?(line)
    line.include?('map:')
  end

  # Reads all maps from the input file, adding data to the corresponding instance variables
  def read_maps_data(strings)
    map = ""
    strings.each do |string|
      if map?(string)
        map = string.split[0]
      elsif !(string == "")
        case map
        when *MAPS_NAMES
          new_range_hash = { destination_range_start: numbers_to_array(string)[0],
          source_range_start: numbers_to_array(string)[1], range_length: numbers_to_array(string)[2] }
          text_to_instance_variable(map).input_ranges << new_range_hash
        end
      end
    end
  end

  # Calculates the start and end of the seed ranges (Part 2)
  def calculate_extended_seeds
    seed_ranges = @seeds.each_slice(2).to_a
    seed_ranges.each do |range|
      range_hash = { seed_start: range[0].to_i, seed_end: range[1].to_i + range[0].to_i }
      @extended_seeds << range_hash
    end
  end

  # Returns the global variable for a specific map name
  def text_to_instance_variable(map_name)
    instance_variable_get("@#{substitute_dashes_to_underscores(map_name)}")
  end

  # Returns a text subsituting dashes with underscores (for instance variable names)
  def substitute_dashes_to_underscores(string)
    string.gsub('-', '_')
  end

  # Converts the input number to the output number of the corresponding map (reusable for all maps)
  def convert_to_next(map, number)
    map.map(number)
  end

  # Converts the input number to the input number of the corresponding map (reusable for all maps)
  def convert_to_previous(map, number)
    map.inverse_map(number)
  end

  # Maps 1 single seed number to its corresponding location
  def seed_to_location(seed)
    number = seed
    MAPS_NAMES.each do |map_name|
      number = convert_to_next(text_to_instance_variable(map_name), number)
    end
    number
  end

  # Maps 1 single location number to its corresponding seed (backwards for Part 2)
  def location_to_seed(location)
    number = location
    MAPS_NAMES.reverse.each do |map_name|
      number = convert_to_previous(text_to_instance_variable(map_name), number)
    end
    number
  end

  # Returns all locations corresponding to all the seeds of the input file once mapped
  def locations
    locations = []
    @seeds.each do |seed|
      locations << seed_to_location(seed)
    end
    locations
  end

  # returns true if the seed corresponding for the given location (backwards) is inside one of the extended seed ranges
  # (Part 2)
  def location_in_seeds?(location)
    seed = location_to_seed(location)
    check_seed_in_ranges(seed)
  end

  # Returns true if a given seed is inside the extended seed ranges (Part 2)
  def check_seed_in_ranges(seed)
    @extended_seeds.each do |range|
      return true if seed.between?(range[:seed_start], range[:seed_end])
    end
    false
  end
end
