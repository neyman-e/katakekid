class Map
  attr_accessor :calculation_ranges
  attr_accessor :input_ranges

  @@maps = []

  def initialize(name)
    @@maps << self
    @name = name
    @calculation_ranges = []
    # @inverted_hash = {}
    @input_ranges = []
  end

  def self.calculate_ranges
    @@maps.each do |map|
      map.calculate_instance_ranges
    end
  end

  def calculate_instance_ranges
    @input_ranges.each do |remapping|
      calculation_hash = {}
      calculation_hash[:source_start] = remapping[:source_range_start]
      calculation_hash[:source_end] = remapping[:source_range_start] + remapping[:range_length] - 1
      calculation_hash[:addition] = remapping[:destination_range_start] - remapping[:source_range_start]
      @calculation_ranges << calculation_hash
    end
  end

  def map(input_number)
    @calculation_ranges.each do |range|
      return input_number + range[:addition] if input_number.between?(range[:source_start], range[:source_end])
    end
    input_number
  end
end
