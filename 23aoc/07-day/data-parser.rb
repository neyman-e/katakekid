require_relative 'poker-hand'

class DataParser
  attr_reader :hands_with_bids

  def initialize(filename, j_is_joker)
    @filename = filename
    @j_is_joker = j_is_joker
    @hands_with_bids = []
    read_data if File.exist?(@filename)
  end

  private

  def read_data
    input = File.open(@filename)
    input.each do |line|
      hand = line.strip.split[0]
      bid = line.strip.split[1].to_i
      hand_with_bid_and_ranks = PokerHand.new(hand, bid, @j_is_joker)
      @hands_with_bids << hand_with_bid_and_ranks.hand_hash
    end
  end
end
