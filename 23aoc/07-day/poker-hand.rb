class PokerHand
  attr_reader :hand_hash, :hand_rank

  CARD_STRENGTHS = { 'A'=> '13', 'K'=> '12', 'Q'=> '11',
                    'J'=> '10', 'T'=> '09', '9'=> '08', '8'=> '07', '7'=> '06',
                    '6'=> '05', '5'=> '04', '4'=> '03', '3'=> '02', '2'=> '01'
  }

  HAND_STRENGTHS = {
    'five_of_a_kind'=> '7',
    'four_of_a_kind'=> '6',
    'full_house'=> '5',
    'three_of_a_kind'=> '4',
    'two_pairs'=> '3',
    'one_pair'=> '2',
    'high_card'=> '1'
  }

  def initialize(hand_input, bid_input)
    @hand = hand_input
    @bid = bid_input
    @counted_cards = {}
    count_cards_in_hand
    @hand_strength = check_hand_strength
    cards_values
    @hand_rank = check_hand_rank
    # Delete the following hash once done. It's just for printing to the console from the app
    @hand_hash = {
      hand: @hand,
      bid: @bid,
      counted_cards: @counted_cards,
      hand_strength: @hand_strength,
      hand_rank: @hand_rank
    } # REMEMBER to DELETE this instance variable
  end

  def count_cards_in_hand
    uniq_cards = @hand.chars.uniq
    uniq_cards.each do |card|
      @counted_cards[card] = @hand.chars.count { |char| char == card }
    end
  end

  def check_hand_strength
    hand_values = @counted_cards.values
    return 'five_of_a_kind' if hand_values.include?(5)
    return 'four_of_a_kind' if hand_values.include?(4)
    return 'full_house' if hand_values.include?(3) && hand_values.include?(2)
    return 'three_of_a_kind' if hand_values.include?(3)
    return 'two_pairs' if hand_values.count { |repetitions| repetitions == 2} == 2
    return 'one_pair' if hand_values.include?(2)
    return 'high_card'
  end

  def cards_values
    @hand.chars.each_index do |index|
      variable_name = "@card#{index}_rank"
      instance_variable_set(variable_name, CARD_STRENGTHS[@hand.chars[index]])
    end
  end

  def check_hand_rank
    rank = []
    rank[0] = HAND_STRENGTHS[@hand_strength]
    5.times do |index|
      variable_name = "@card#{index}_rank"
      rank[index + 1] = instance_variable_get(variable_name)
    end
    rank.join
  end
end
