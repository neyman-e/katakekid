class Record
  def initialize(spring_info, group)
    @group = group
    @spring_info = spring_info
  end

  def ideal_case
    chars = []
    @group.each_with_index do |number, index|
      # If we are a the last position, append only the number of #'s
      # At any other position, append the number of #'s and a '.' afterwards
      chars << (index == @group.size - 1 ? '#' * number : '#' * number + '.')
    end
    chars.join
  end

  def pending_chars
    no_dots.length - ideal_case.length
  end

  def no_dots
    reduced_string = @spring_info.gsub(/\.+/,'.').chars
    reduced_string.shift if reduced_string[0] == '.'
    reduced_string.pop if reduced_string[-1] == '.'
    reduced_string.join
  end

  def possibilities
    return 1 if pending_chars < 2
    -1
  end

end
