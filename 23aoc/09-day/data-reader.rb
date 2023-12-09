class DataReader
  attr_reader :list

  def initialize(filename)
    @filename = filename
    @list = []
    read_data if File.exist?(filename)
  end

  def read_data
    data_input = File.open(@filename)
    data_input.each { |line| @list << line.strip.split.map { |number| number.to_i } }
  end
end
