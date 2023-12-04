require_relative 'card'

class CardList
  def initialize(input_file)
    @input_file = input_file
    @cards = []
    read_cards_file if File.exist?(@input_file)
  end


  def all
    @cards
  end

  def output_data
    @cards.each do |card|
      p "Card #{card.card_number}: Winning numbers: #{card.winning_numbers} - My numbers #{card.playing_numbers}"
    end
  end

  def total_score
    sum = 0
    @cards.each do |card|
      sum += card.score
    end
    sum
  end

  private

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
