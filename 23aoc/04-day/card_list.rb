require_relative 'card'

class CardList
  def initialize(input_file)
    @input_file = input_file
    @cards = []
    read_cards_file if File.exist?(@input_file)
  end

  # Returns the sum of all cards' scores (Part 1)
  def total_score
    sum = 0
    @cards.each do |card|
      sum += card.score
    end
    sum
  end

  # Returns the total amount of cards, once they have been replicated (Part 2)
  def total_cards
    replicate_cards
    sum = 0
    @cards.each do |card|
      sum += card.playing_cards_count
    end
    sum
  end

  private

  # Reads the input file and processes all data, appending every card information into the cards array (both parts)
  def read_cards_file
    input = File.open(@input_file)
    input.each do |line|
      line_inputs = line.split(/: | \| /)
      card_number = line_inputs[0].split(' ')[1].to_i
      winning_numbers = line_inputs[1].split(' ').map { |number| number.to_i }
      playing_numbers = line_inputs[2].split(' ').map { |number| number.to_i }
      @cards << Card.new(card_number, winning_numbers, playing_numbers)
    end
  end

  # Will add all the copies of every single card, because the previous ones have several matching numbers (Part 2)
  def replicate_cards
    @cards.each do |card|
      index = card.card_number
      for i in 0..card.hits - 1
        @cards[index + i].playing_cards_count += card.playing_cards_count if (index + i <= @cards.length - 1)
      end
    end
  end
end
