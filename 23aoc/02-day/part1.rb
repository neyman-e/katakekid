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

def game_possible?(objectified_game)
  objectified_game['subsets'].all? do |subset|
    subset['red'] <= 12 && subset['green'] <= 13 && subset['blue'] <= 14
  end
end

possible_games = []

# Make sure the file exists
if File.exist?(input_file)
  input = File.open(input_file)
  input.each do |game|
    objectified_game = read_game(game)
    possible_games << objectified_game['game'] if game_possible?(objectified_game)
  end
end

puts possible_games.sum
