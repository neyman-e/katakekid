class DataReader
  attr_reader :data

  def initialize(filename)
    @data = []
    read_data(filename) if File.exist?(filename)
  end

  private

  def read_data(filename)
    data_input = File.read(filename)
    data_input.each_line do |line|
      @data << line.strip.chars
    end
  end
end
