require_relative 'card_list'

cards = CardList.new('input.txt')
# cards.output_data
puts "The sum of all card scores is #{cards.total_score}"
