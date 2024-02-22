require_relative 'tile'

class Contraption
  def initialize(filename)
    read_data(filename) if File.exist?(filename)
  end

  private

  def read_data(filename)
    data_input = File.read(filename)
    @tiles = []
  end
end
