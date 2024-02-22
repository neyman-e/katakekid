class ParabolicDish
  def initialize(input_parab_dish)
    parabolic_dish = input_parab_dish
    parabolic_dish.each { p _1.join}
    @dish_height = parabolic_dish.length
    @north_parab_dish = parabolic_dish.transpose
    tilt_north
  end

  def tilt_north
    @weights = []
    @north_parab_dish.each do |row|
      cubes = find_cube_rocks(row)
      p cubes
      for index in 0...(cubes.length - 1)
        slices = row.slice(cubes[index], cubes[index + 1] - cubes[index])
        p slices.join
      end
    end
  end

  def find_cube_rocks(line)
    cubes = []
    line.each_with_index{|char, index| cubes << index if char == '#'}
    cubes.prepend(0)
    cubes
  end

  # def slices

  # end
end
