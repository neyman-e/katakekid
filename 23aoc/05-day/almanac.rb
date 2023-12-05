require_relative 'map'

class Almanac
  attr_reader :seeds

  MAPS_NAMES = ["seed-to-soil", "soil-to-fertilizer", "fertilizer-to-water",
    "water-to-light", "light-to-temperature", "temperature-to-humidity",
    "humidity-to-location"]

  def initialize(input_file)
    @input_file = input_file
    @seeds = []
    MAPS_NAMES.each do |map_name|
      instance_variable_set("@#{substitute_dashes_to_underscores(map_name)}", Map.new(map_name))
    end
    read_almanac if File.exist?(@input_file)
  end

  def output_almanac
    puts "Seeds: #{@seeds.inspect}"
    puts
    MAPS_NAMES.each do |map_name|
      puts " ----- "
      puts
      puts map_name.upcase.gsub('-', ' ')
      puts "Input ranges:"
      puts text_to_instance_variable(map_name).input_ranges
      puts
      puts "Map hash:"
      puts ""
      puts text_to_instance_variable(map_name).calculation_ranges
      puts
    end
  end

  def lowest_location
    locations.min
  end

  private

  def read_almanac
    # Load the file into an array of strings
    input_content = []
    input = File.open(@input_file)
    input.each { |line| input_content << line.to_s.chomp }

    # Read the seeds numbers from 1st line
    @seeds = numbers_to_array(input_content[0].gsub('seeds: ', ''))
    read_maps_data(input_content)
    Map.calculate_ranges
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

  # Returns the global variable for a specific map name
  def text_to_instance_variable(map_name)
    instance_variable_get("@#{substitute_dashes_to_underscores(map_name)}")
  end

  # Returns a text subsituting dashes with underscores (for instance variable names)
  def substitute_dashes_to_underscores(string)
    string.gsub('-', '_')
  end

  def convert_to_next(map, number)
    map.map(number)
  end

  def seed_to_location(seed)
    number = seed
    MAPS_NAMES.each do |map_name|
      number = convert_to_next(text_to_instance_variable(map_name), number)
    end
    number
  end

    def locations
      locations = []
      @seeds.each do |seed|
        locations << seed_to_location(seed)
      end
      locations
    end
end
