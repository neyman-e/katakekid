class SmudgePattern
  attr_reader :result

  def initialize(pattern)
    rows_array = pattern.map(&:chars)
    @rows = rows_array.map(&:join)
    @cols = rows_array.transpose.map(&:join)
    @result = find_reflection(@cols) + find_reflection(@rows) * 100
  end

  private

def find_reflection(rows)
  for index in 1..rows.length - 1
    if rows[index] == rows[index - 1]
      return index if check_reflection(index, rows)
    end
  end
  0
end

  def check_reflection(index, lines)
    lines_length = lines.length
    first_part = lines.slice(0,index)
    second_part = lines.slice(index, lines_length - index)
    lines_to_remove = second_part.length - first_part.length
    if lines_to_remove > 0
      (lines_to_remove).times { |i| second_part.pop }
      second_part.reverse!
    elsif lines_to_remove < 0
      (0 - lines_to_remove).times { |i| first_part.shift }
      first_part.reverse!
    end
    first_part == second_part
  end
end
