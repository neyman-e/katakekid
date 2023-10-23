def power_sumDigTerm(n)
  # Initialize the series array with 0, as we will be always prompted with an index over 0 and the array
  # starts with the index 0
  series = [0]

  # We gotta check powering numbers from 2 to high number i.e. 100
  100.times do |number|

    # And check them elevated to powers from 2 to "not too high" as the results will be getting huge quickly
    20.times do |power|
      result = number**power

      # I add here the condition of the result needing to be 10 or higher, as the notation of #times is preferred
      series << result if result > 9 && number == result.digits.sum
    end
  end

  # We return the n'th value of the sorted array
  series.sort[n]
end
