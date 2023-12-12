class DataReader
  attr_reader :springs_info, :groups

  def initialize(filename)
    read_data(filename) if File.exist?(filename)
  end

  def read_data(filename)
    data_input = File.open(filename)
    @data = data_input.readlines.map(&:strip)
    @springs_info = []
    @groups = []
    @data.each do |line|
      @springs_info << line.split[0]
      @groups << line.split[1].split(',').map(&:to_i)
    end
  end
end
