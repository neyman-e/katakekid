class Data
  attr_reader :sequence, :links
  def initialize(filename)
    @filename = filename
    @sequence = ''
    @links = {}
    read_data if File.exist?(@filename)
  end

  def read_data
    input = File.open(@filename)
    input_array = []
    input.each { |line| input_array << line.strip}
    @sequence = input_array.shift.chars.map { |char| char == 'L' ? 0 : 1}
    input_array.shift
    @links = input_array
  end
end
