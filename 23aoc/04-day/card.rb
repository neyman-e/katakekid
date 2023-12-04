class Card
  attr_reader :card_number, :winning_numbers, :playing_numbers

  def initialize(card_number, winning_numbers, playing_numbers)
    @card_number = card_number
    @winning_numbers = winning_numbers
    @playing_numbers = playing_numbers
  end

  def score
    count = 0
    @playing_numbers.each do |number|
      count += 1 if @winning_numbers.include?(number)
    end
    count > 0 ? 2 ** (count - 1) : 0
  end
end
