require_relative 'data-parser'
require_relative 'poker-hand'

class HandsSet
  attr_reader :sorted_hands, :hands_with_bids, :winnings

  def initialize(filename, j_is_joker)
    hands_set = DataParser.new(filename, j_is_joker)
    @hands_with_bids = hands_set.hands_with_bids
    @sorted_hands = @hands_with_bids.sort_by { |hand_data| -hand_data[:hand_rank] }
    @winnings = 0
    calculate_winnings
  end

  def calculate_winnings
    @sorted_hands.each_index do |index|
      rank = index + 1
      @winnings += @sorted_hands[index][:bid] * rank
    end
  end
end
