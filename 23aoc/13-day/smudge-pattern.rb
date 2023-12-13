class SmudgePattern
  attr_reader :result

  def initialize(pattern, pattern_number)
    puts "         ---------         Pattern - #{pattern_number}         ---------         "
    rows_array = pattern.map(&:chars)
    @rows = rows_array.map(&:join)
    @cols = rows_array.transpose.map(&:join)
    puts
    puts "Checking rows"
    @result = find_reflection(@rows) * 100
    puts
    puts "Checking columns"
    @result = find_reflection(@cols) if @result == 0
    puts
    puts "Result: #{@result}"
    puts
  end

  private

  def find_reflection(lines)
    lines.each_with_index {|line, index| printf("%02d: %s\n", index, line)}
    for i in 0...lines.length
      for j in i...lines.length
        if one_difference?(lines[i], lines[j])
          mirror_index = ((j - i) / 2.0 + i).ceil
          fixed_lines = fix_smudge(lines, i, j)
          return mirror_index if check_reflection(mirror_index, fixed_lines)
        end
      end
    end
    0
  end

  def fix_smudge(lines, i, j)
    puts
    printf "%02d - %s\n", i, lines[i]
    printf "%02d - %s\n", j, lines[j]
    puts
    pattern_lines = lines.dup
    string1 = lines[i].chars
    string2 = lines[j].chars
    position = -1
    string1.each_with_index do |char, index|
      position = index if char != string2[index]
    end
    string1[position] = string2[position]
    pattern_lines[i] = string1.join
    pattern_lines
  end

  def check_reflection(index, lines)
    lines_length = lines.length
    first_part = lines.slice(0, index)
    second_part = lines.slice(index, lines_length - index)
    lines_to_remove = second_part.length - first_part.length
    if lines_to_remove > 0
      (lines_to_remove).times { |i| second_part.pop }
      second_part.reverse!
    elsif lines_to_remove < 0
      (0 - lines_to_remove).times { |i| first_part.shift }
      first_part.reverse!
    end
    # p first_part
    # p second_part
    first_part == second_part
  end

  def one_difference?(string1, string2)
    differences = 0
    string1.chars.each_index do | index|
      differences += 1 if string1[index] != string2[index]
      return false if differences > 1
    end
    differences == 1
  end
end
