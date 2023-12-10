require_relative 'node'

class Map
  attr_reader :moves

  def initialize(map_input)
    @map_input = map_input
    @map_height = @map_input.size
    @map_width = @map_input[0].size
    @animal_coords = find_animal
    @map = Array.new(@map_height) { [] }
    create_nodes_map
    create_animal_neighbours
    @map[@animal_coords[0]][@animal_coords[1]].neighbours = @animal_neighbours
    follow_pipe
    substitute_s
  end

  # Let's transform all chars of our map into '.' unless they are part of the pipe path
  def to_dots
    @map_height.times do |row_coord|
      @map_width.times do |column_coord|
        @map[row_coord][column_coord].char = '.' unless @map[row_coord][column_coord].pipe_path
      end
    end
  end

  # Returns an array very similar to the map_input (from the input file)
  # This method is meant to be called on the whole instance (from the outside)
  def to_array
    new_map = []
    @map_height.times do |row_coord|
      new_line = []
      @map_width.times do |column_coord|
        new_line << @map[row_coord][column_coord].char
      end
      new_map << new_line.join
    end
    new_map
  end

  private

  # Returns the coordinates of the animal ('S' on our array or map)
  def find_animal
    @map_height.times do |row_coord|
      @map_width.times do |column_coord|
        return [row_coord, column_coord] if animal_found?(row_coord, column_coord)
      end
    end
    nil
  end

  # Creates the whole array of nodes (class)
  def create_nodes_map
    @map_height.times do |row_coord|
      @map_width.times do |column_coord|
        @animal_coords = [row_coord, column_coord] if animal_found?(row_coord, column_coord)
        @map[row_coord][column_coord] = Node.new(@map_input[row_coord][column_coord], row_coord, column_coord)
      end
    end
  end

  # Creates all possible neighbours of the animal (char 'S') by checking if they lead to it
  # If the input is correct, only 2 should be created
  def create_animal_neighbours
    north_possible_directions = ['7', '|', 'F']
    east_possible_directions = ['J', '-', '7']
    south_possible_directions = ['J', '|', 'L']
    west_possible_directions = ['L', '-', 'F']
    x = @animal_coords[0]
    y = @animal_coords[1]
    @animal_neighbours = []
    @animal_neighbours << [x - 1, y] if inside_bounds?(x - 1, y) && north_possible_directions.include?(@map[x - 1][y].char)
    @animal_neighbours << [x, y + 1] if inside_bounds?(x, y + 1) && east_possible_directions.include?(@map[x][y + 1].char)
    @animal_neighbours << [x + 1, y] if inside_bounds?(x + 1, y) && south_possible_directions.include?(@map[x + 1][y].char)
    @animal_neighbours << [x, y - 1] if inside_bounds?(x, y - 1) && west_possible_directions.include?(@map[x][y - 1].char)
  end

  # Follows the pipe from the start (the animal's position)
  # It also sets the boolean pipe_path as true to each every node of the main pipe loop
  def follow_pipe
    animal_found = false
    previous_node = @animal_coords
    x = @animal_neighbours.first[0]
    y = @animal_neighbours.first[1]
    @moves = 1
    loop do
      break if animal_found?(x, y)
      @map[x][y].pipe_path = true
      next_node_coords = @map[x][y].next_node(previous_node[0], previous_node[1])
      previous_node = [x, y]
      x = next_node_coords[0]
      y = next_node_coords[1]
      @moves += 1
    end
    @map[@animal_coords[0]][@animal_coords[1]].pipe_path = true
  end

  # Substitutes the S character of the animal's start position by the correct one
  def substitute_s
    d1x = @animal_coords[0] - @map[@animal_coords[0]][@animal_coords[1]].neighbours[0][0]
    d1y = @animal_coords[1] - @map[@animal_coords[0]][@animal_coords[1]].neighbours[0][1]
    d2x = @map[@animal_coords[0]][@animal_coords[1]].neighbours[1][0] - @animal_coords[0]
    d2y = @map[@animal_coords[0]][@animal_coords[1]].neighbours[1][1] - @animal_coords[1]
    diff = [[d1x, d1y], [d2x, d2y]]
    new_char = 'L' if diff == [[1, 0], [0, 1]] || diff == [[0, -1], [-1, 0]]
    new_char = 'F' if diff == [[0, -1], [1, 0]] || diff == [[-1, 0], [0, 1]]
    new_char = '7' if diff == [[-1, 0], [0, -1]] || diff == [[0, 1], [1, 0]]
    new_char = 'J' if diff == [[0, 1], [-1, 0]] || diff == [[1, 0], [0, -1]]
    @map[@animal_coords[0]][@animal_coords[1]].char = new_char
  end

  # Checks if the animal (character 'S') is at the given coordinates
  # Uses the initial map_input from the input file to be able to reuse the method for more than 1 use
  def animal_found?(row_coord, column_coord)
    @map_input[row_coord][column_coord] == 'S'
  end

  # Checks if the coordinates are inside of the map bounds
  def inside_bounds?(x, y)
    return true if x >= 0 && x <= @map_height && y >= 0 && y <= @map_width
    false
  end
end
