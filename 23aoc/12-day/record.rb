class Record
  attr_reader :group, :springs_pattern

  def initialize(springs_pattern, group)
    @group = group
    @springs_pattern = springs_pattern
    tests
  end

  def possibilities
    0
  end

  def tests
    c = @springs_pattern.chunk { |char| char }

    c.each { p _1}
  end
end
