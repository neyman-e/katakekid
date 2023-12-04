class Card
  attr_reader :card_number, :winning_numbers, :playing_numbers
  attr_accessor :playing_cards_count

  def initialize(card_number, winning_numbers, playing_numbers)
    @card_number = card_number
    @winning_numbers = winning_numbers
    @playing_numbers = playing_numbers
    @playing_cards_count = 1
  end

  # Returns the card's score based on the number of matching numbers -hits-, doubling for every hit (Part 1)
  def score
    hits > 0 ? 2 ** (hits - 1) :0
  end

  # Returns the card's number of matching numbers -hits- (both parts)
  def hits
    count = 0
    @playing_numbers.each do |number|
      count += 1 if @winning_numbers.include?(number)
    end
    count
  end
end
