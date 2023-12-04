class Card
  attr_reader :card_number, :winning_numbers, :playing_numbers
  attr_accessor :playing_cards_count

  def initialize(card_number, winning_numbers, playing_numbers)
    @card_number = card_number
    @winning_numbers = winning_numbers
    @playing_numbers = playing_numbers
    @playing_cards_count = 1
  end

  def score
    hits > 0 ? 2 ** (hits - 1) :0
  end

  def hits
    count = 0
    @playing_numbers.each do |number|
      count += 1 if @winning_numbers.include?(number)
    end
    count
  end
end
