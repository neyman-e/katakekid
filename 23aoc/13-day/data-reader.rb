class DataReader
  attr_reader :data
  def initialize(filename)
    read_data(filename) if File.exist?(filename)
  end

  def read_data(file_input)
    file_content = File.read(file_input)
    chunks = file_content.split(/\n\s*\n/)
    @data = chunks.map { |chunk| chunk.lines.map(&:strip) }
  end
end
