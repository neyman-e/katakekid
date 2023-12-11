class Data
  attr_reader :distances_between_galaxies

  def initialize(filename)
    @filename = filename
    read_data if File.exist?(@filename)
    @space_height = @vertical_expanded_indexes.length
    @space_width = @horizontal_expanded_indexes.length
    find_all_galaxies
    measure_distance_between_galaxies
  end

  private

  def read_data
    data_input = File.open(@filename)
    @rows = data_input.each_line.map(&:chomp).map(&:chars)
    expand_space
  end

  def expand_space
    @vertical_expanded_indexes = expand_indexes(@rows)
    @horizontal_expanded_indexes = expand_indexes(@rows.transpose)
  end

  def expand_indexes(lines)
    expansion = 1_000_000
    new_indexes = []
    lines.each do |row|
      previous = new_indexes.empty? ? -1 : new_indexes.last
      if row.include?('#')
        new_indexes << previous + 1
      else
        new_indexes << previous + expansion
      end
    end
    new_indexes
  end

  def find_all_galaxies
    @galaxies_list = []
    @space_height.times do |vert_coord|
      @space_width.times do |horiz_coord|
        if @rows[vert_coord][horiz_coord] == '#'
          @galaxies_list << [@vertical_expanded_indexes[vert_coord], @horizontal_expanded_indexes[horiz_coord]]
        end
      end
    end
  end

  def measure_distance_between_galaxies
    @distances_between_galaxies = []
    pending_galaxies = @galaxies_list.dup
    @galaxies_list.each do |orig_coords|
      pending_galaxies.shift
      pending_galaxies.each do |dest_coords|
        vertical_distance = [dest_coords[0], orig_coords[0]].max - [dest_coords[0], orig_coords[0]].min
        horizontal_distance = [dest_coords[1], orig_coords[1]].max - [dest_coords[1], orig_coords[1]].min
        distance = vertical_distance + horizontal_distance
        @distances_between_galaxies << distance
      end
    end
  end
end
