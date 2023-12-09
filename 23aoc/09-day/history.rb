class History
  def initialize(history_input)
    @all_sequences = []
    @all_sequences << history_input
    @last_sequence_found = false
    until @last_sequence_found
      generate_subsequence
    end
    extrapolate_next_value
    extrapolate_previous_value
  end

  # Returns the next value of the original history sequence after having been extrapolated
  def next_value
    @all_sequences[0].last
  end

  # Returns the previous value of the original history sequence after having been extrapolated
  def previous_value
    @all_sequences[0].first
  end

  private

  # It returns true if the sequence given only has zeroes
  def zeros_sequence?(sequence)
    sequence.tally.keys == [0]
  end

  # Generates all the subsequences with the differences between numbers
  def generate_subsequence
    new_sequence = []
    base_sequence = @all_sequences.last

    # As the differences sequence will need one less number, we iterate 1 time less
    (base_sequence.size - 1).times do |index|
      new_sequence << base_sequence[index + 1] - base_sequence[index]
    end

    @all_sequences << new_sequence
    @last_sequence_found = true if zeros_sequence?(new_sequence)
  end

  # Extrapolates all next values. It does it from the zeroes sequence and backwards,
  # adding the next value for each subsequence, until it gets to the main one
  def extrapolate_next_value
    # As the last sequence always has all the values being 0, we just append a new 0
    @all_sequences.last << 0

    # As the zeroes sequence has already been done (and is different) we iterate over all subsequences except that one
    (@all_sequences.size - 1).times do |index|
      # We do it end to begin, so better have an inverse index. We substract -2 because we start at the second to last
      inverse_index = @all_sequences.size - index - 2
      @all_sequences[inverse_index] << @all_sequences[inverse_index].last + @all_sequences[inverse_index + 1].last
    end
  end

  # Very similar to method History#extrapolate_next_value, but prepending previous values at the very beginning
  def extrapolate_previous_value
    @all_sequences.last.prepend(0)
    (@all_sequences.size - 1).times do |index|
      inverse_index = @all_sequences.size - index - 2
      @all_sequences[inverse_index].prepend(@all_sequences[inverse_index].first - @all_sequences[inverse_index + 1].first)
    end
  end
end
