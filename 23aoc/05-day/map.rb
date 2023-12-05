class Map
  attr_accessor :input_ranges, :calculation_ranges, :inverted_calculation_ranges

  # Global class variable including all instances of map
  @@maps = []

  def initialize(name)
    @@maps << self
    @name = name
    # The calculation hash will allow to quickly calculate the mapped number to an input number of a map
    @input_ranges = []
    @calculation_ranges = []
    @inverted_calculation_ranges = []
  end

  # Class method calculating all instance hashes which allow to map any number to their mapped number
  def self.calculate_ranges
    @@maps.each do |map|
      map.calculate_instance_ranges
    end
  end

  # Instance method calculation
  def calculate_instance_ranges
    # Iterate through all raw input ranges to calculate the calculation hash
    @input_ranges.each do |remapping|
      calculation_hash = {}
      calculation_hash[:source_start] = remapping[:source_range_start]
      calculation_hash[:source_end] = remapping[:source_range_start] + remapping[:range_length] - 1
      calculation_hash[:addition] = remapping[:destination_range_start] - remapping[:source_range_start]
      @calculation_ranges << calculation_hash
    end

    # Iterate through all calculation hashes previously calculated, giving back the inverse calculation ranges
    @calculation_ranges.each do |calc_range|
      inverse_hash = {}
      inverse_hash[:source_start] = calc_range[:source_start] + calc_range[:addition]
      inverse_hash[:source_end] = calc_range[:source_end] + calc_range[:addition]
      inverse_hash[:addition] = 0 - calc_range[:addition]
      @inverted_calculation_ranges << inverse_hash
    end
  end

  # Returns the mapped number given a mapping range of the current map
  def map(input_number)
    @calculation_ranges.each do |range|
      return input_number + range[:addition] if input_number.between?(range[:source_start], range[:source_end])
    end
    input_number
  end

  # Returns the inverse mapped number given a mapping range of the current map
  def inverse_map(output_number)
    @inverted_calculation_ranges.each do |range|
      return output_number + range[:addition] if output_number.between?(range[:source_start], range[:source_end])
    end
    output_number
  end
end
