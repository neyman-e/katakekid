class Node
  attr_accessor :neighbours, :pipe_path, :char

  def initialize(char, row_coord, column_coord)
    @char = char
    @row_coord = row_coord
    @column_coord = column_coord
    @pipe_path = false
    # @max_coord = max_coord
    @neighbours = []
    create_neighbours
  end

  # Creates the neighbours for each node, except for the animal's position (with character 'S')
  # For that, other information is required
  def create_neighbours
    case @char
    when '|'
      @neighbours << [@row_coord + 1, @column_coord]
      @neighbours << [@row_coord - 1, @column_coord]
    when '-'
      @neighbours << [@row_coord, @column_coord - 1]
      @neighbours << [@row_coord, @column_coord + 1]
    when 'L'
      @neighbours << [@row_coord - 1, @column_coord]
      @neighbours << [@row_coord, @column_coord + 1]
    when 'J'
      @neighbours << [@row_coord, @column_coord - 1]
      @neighbours << [@row_coord - 1, @column_coord]
    when '7'
      @neighbours << [@row_coord, @column_coord - 1]
      @neighbours << [@row_coord + 1, @column_coord]
    when 'F'
      @neighbours << [@row_coord + 1, @column_coord]
      @neighbours << [@row_coord, @column_coord + 1]
    end
  end

  # Returns the node's neighbour after deleting the previous one from this node's neighbours array
  def next_node(previous_node_row, previous_node_column)
    @neighbours.delete([previous_node_row, previous_node_column])
    @neighbours.flatten
  end
end
