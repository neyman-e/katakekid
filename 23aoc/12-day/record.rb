class Record
  attr_reader :group, :springs_pattern

  def initialize(springs_pattern, group)
    @group = group
    @springs_pattern = springs_pattern
  end

  def possibilities
    0
  end
end
