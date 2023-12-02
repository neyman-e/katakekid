input_file = 'input.txt'

COLORS = ['red', 'green', 'blue']

def objectify_subset(subset_input)
  cubes_sets = subset_input.split(',')
  objectified_subset = {}
  cubes_sets.each do |colorset|
    color = colorset.split(' ')[1]
    quantity = colorset.split(' ')[0].to_i
    objectified_subset[color] = quantity
  end
  COLORS.each do |color|
    objectified_subset[color] = 0 if !(objectified_subset.has_key?(color))
  end
  objectified_subset
end

def read_subsets(subsets_input)
  objectified_subsets = subsets_input.map { |subset| objectify_subset(subset) }
end

def read_game(game_input)
  game_hash = {}
  game_number = game_input.split(':')[0].split(' ').last.to_i
  game_hash['game'] = game_number
  subsets_input = game_input.chomp.split(':')[1].split(';')
  game_hash['subsets'] = read_subsets(subsets_input)
  game_hash
end

def min_cubes(objectified_subsets)
  # Initialize max values
  max_cubes = {"green" => 0, "red" => 0, "blue" => 0}

  # Iterate through each subset
  objectified_subsets.each do |subset|
    # Update max values for each color
    subset.each do |color, number|
      max_cubes[color] = [max_cubes[color], number].max
    end
  end
  max_cubes
end

games_powers = []

# Make sure the file exists
if File.exist?(input_file)
  input = File.open(input_file)
  input.each do |game|
    objectified_game = read_game(game)
    games_powers << min_cubes(objectified_game['subsets']).values.reduce(:*)
  end
end

puts "Puzzle 2: The sum of the power of the games is #{games_powers.sum}"
