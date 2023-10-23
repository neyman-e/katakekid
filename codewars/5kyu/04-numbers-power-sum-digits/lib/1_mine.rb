def power_sumDigTerm(n)
  series = [0]
  100.times do |number|
    number +=1
    20.times do |power|
      power += 1
      series << (number**power) if (number == (number**power).digits.sum) && (number**power).digits.length > 1
    end
  end
  series.sort[n]
end
