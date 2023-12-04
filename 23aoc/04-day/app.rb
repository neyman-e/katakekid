require_relative 'card_list'

# Initialize our input by calling the correct file
cards = CardList.new('input.txt')

# Solutions' output:
puts "The sum of all card scores is #{cards.total_score} (Part 1)"
puts "The overall number of scratchcards is #{cards.total_cards} (Part 2)"
