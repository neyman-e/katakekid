class DataReader
  attr_reader :data

  def initialize(filename)
    @filename = filename
    @data = []
    read_data if File.exist?(@filename)
  end

  private

  def read_data
    data_input = File.open(@filename)
    data_input.each do |line|
      @data << line.strip.chars
    end
  end
end
