class Pattern
  def initialize(pattern)
    @rows = pattern.map(&:chars)
    @cols = @rows.transpose
    @rows.each { |line_array| puts line_array.join }
    puts
    @cols.each { |line_array| puts line_array.join }
    puts
  end
end
