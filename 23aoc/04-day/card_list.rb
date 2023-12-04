require_relative 'card'

class CardList
  def initialize(input_file)
    @input_file = input_file
    @cards = []
    read_cards_file if File.exist?(@input_file)
  end

  def total_score
    sum = 0
    @cards.each do |card|
      sum += card.score
    end
    sum
  end

  def total_cards
    replicate_cards
    sum = 0
    @cards.each do |card|
      sum += card.playing_cards_count
    end
    sum
  end

  private

  def replicate_cards
    @cards.each do |card|
      index = card.card_number
      # p @cards[0].playing_cards_count
      for i in 0..card.hits - 1
        # @cards[index + i].playing_cards_count += card.hits * card.playing_cards_count if (index + i <= @cards.length - 1)
        @cards[index + i].playing_cards_count += card.playing_cards_count if (index + i <= @cards.length - 1)
      end
    end
  end

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
end
