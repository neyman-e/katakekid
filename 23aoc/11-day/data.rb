class Data
  attr_reader :expanded_space_universe, :distances_between_galaxies

  def initialize(filename)
    @filename = filename
    @expanded_space_universe = []
    read_data if File.exist?(@filename)
    @space_width = @expanded_space_universe[0].length
    @space_height = @expanded_space_universe.length
    @galaxies_list = []
    find_all_galaxies
    @distances_between_galaxies = []
    measure_distance_between_galaxies
  end

  private

  def read_data
    data_input = File.open(@filename)
    @expanded_space_universe = expand_space(data_input)
  end

  def expand_space(data)
    rows = data.each_line.map(&:chomp).map(&:chars)
    rows = expand_space_by_rows(rows)
    cols = expand_space_by_rows(rows.transpose)
    cols.transpose
  end

  def expand_space_by_rows(lines)
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
    #                                       #
    # FALTA ACABAR D'INTENTAR NETEJAR CODI  #
    # INTENTANT ACABAR D'IMPLEMENTAR        #
    # LA PART COMENTADA I ESBORRANT L'ALTRA #
    #                                       #
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

    # lines.reverse.each_with_index do |row, index|
    #   lines.insert(lines.length - index - 1, Array.new(row.length, '.')) unless row.include?('#')
    # end
    # lines

    empty_lines_indexes = []
    lines.each_with_index do |row, index|
      empty_lines_indexes << index unless row.include?('#')
    end
    row_length = lines[0].length
    empty_lines_indexes.reverse.each do |index|
      lines.insert(index, Array.new(row_length, '.'))
    end
    lines
  end

  def find_all_galaxies
    @space_height.times do |vert_coord|
      @space_width.times do |horiz_coord|
        @galaxies_list << [vert_coord, horiz_coord] if @expanded_space_universe[vert_coord][horiz_coord] == '#'
      end
    end
  end

  def measure_distance_between_galaxies
    pending_galaxies = @galaxies_list.dup
    @galaxies_list.each_with_index do |orig_coords, index|
      pending_galaxies.shift
      pending_galaxies.each_with_index do |dest_coords, j_index|
        vertical_distance = [dest_coords[0], orig_coords[0]].max - [dest_coords[0], orig_coords[0]].min
        horizontal_distance = [dest_coords[1], orig_coords[1]].max - [dest_coords[1], orig_coords[1]].min
        distance = vertical_distance + horizontal_distance
        @distances_between_galaxies << distance.abs
      end
    end
    puts "The sum is #{@distances_between_galaxies.sum}"
  end
end
