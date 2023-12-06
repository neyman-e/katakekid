class RaceMath
  # Init (Parts 1 and 2)
  def initialize
  end

  # It calculates the final result, multiplying the ways to win for each race (Parts 1 and 2)
  def calculate_result(race_records)
    result = 1
    race_records.each do |race_record|
      race_record[:wins] = count_ways_to_win(race_record)
      result *= race_record[:wins]
    end
    result
  end

  private

  # Checks whether a float number has "0" as decimals and could be converted into an integer without loosing data
  def is_integer?(float)
    float.to_i == float
  end

  # Solves a quadratic equation. The sign is to calculate the +- in the formula
  def quadratic_equation_solution(a, b, c, sign)
    discriminant = b ** 2 - 4 * a * c
    square_root = Math.sqrt(discriminant)
    (- b + (sign * square_root)) / (2 * a)
  end

  # Defines the race upper and lower limits given the distance to beat
  def define_limits(race_time, distance)
    limits = {}
    max = quadratic_equation_solution(1, 0 - race_time, distance, 1)
    min = quadratic_equation_solution(1, 0 - race_time, distance, -1)
    is_integer?(max) ? upper_limit = max - 1 : upper_limit = max.floor
    is_integer?(min) ? lower_limit = min + 1 : lower_limit = min.ceil
    { upper_limit: upper_limit.to_i, lower_limit: lower_limit.to_i}
  end

  # Counts how many ways there are to win the race with higher scores than the one to beat
  def count_ways_to_win(race_record)
    limits = define_limits(race_record[:race_time], race_record[:distance_challenge])
    limits[:upper_limit] - limits[:lower_limit] + 1
  end
end
