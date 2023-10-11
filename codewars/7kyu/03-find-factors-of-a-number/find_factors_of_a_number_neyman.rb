def factors(x)
  if x.is_a?(Integer) && x.positive?
    integers_until_x = (1..x).to_a                                # Creating array with all integers from 1 to x
    factors = integers_until_x.select{ |number| x % number == 0}  # Removing all numbers without a integer division
    inversed_factors = factors.reverse                            # Inversing the order as per spec
  else
    -1
  end
end
