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

  def next_value
    @all_sequences[0].last
  end

  def previous_value
    @all_sequences[0].first
  end

  private

  def zeros_sequence?(sequence)
    sequence.tally.keys == [0]
  end

  def generate_subsequence
    new_sequence = []
    base_sequence = @all_sequences.last
    (base_sequence.size - 1).times do |index|
      new_sequence << base_sequence[index + 1] - base_sequence[index]
    end
    @all_sequences << new_sequence
    @last_sequence_found = true if zeros_sequence?(new_sequence)
  end

  def extrapolate_next_value
    @all_sequences.last << 0
    (@all_sequences.size - 1).times do |index|
      inverse_index = @all_sequences.size - index - 2
      @all_sequences[inverse_index] << @all_sequences[inverse_index].last + @all_sequences[inverse_index + 1].last
    end
  end

  def extrapolate_previous_value
    @all_sequences.last.prepend(0)
    (@all_sequences.size - 1).times do |index|
      inverse_index = @all_sequences.size - index - 2
      @all_sequences[inverse_index].prepend(@all_sequences[inverse_index].first - @all_sequences[inverse_index + 1].first)
      # p @all_sequences
    end
  end
end
