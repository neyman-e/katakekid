require 'set'
ENCRYPTED_WORDS = ["DAM?", "Mjqqt, btwqi!", "DAM? DAM! DAM.", "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."]
SEPARATE_ENCRYPTED_WORDS = ["DAM", "Mjqqt", "btwqi", "Gur", "dhvpx", "oebja", "sbk",
                            "whzcf", "bire", "gur", "ynml", "qbt"].to_set
WORDS = ["wtf", "hello", "world", "the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"].sort.to_set

def shift_characters(phrase, shift)
  phrase.chars.map do |char|
    # We need to always count in the same direction
    # Thus, we need to check if the character ordinal will need to go from a'z ordinal, 97 to z's ordinal, 122
    # This ordinals correspond to the letters' positions in the alphabet which are
    # 0-a (97), 1-b (98), 2-c (99), 3-d (100), ..., 24-y (121), 25-z (122)
    if (char.ord - shift) >= 97
      # We don't need to jump from 0 to 26, so we just directly substract
      (char.ord - shift).chr
    else
      # We do jump from 0 to 26 so we do need to add 26
      (26 + char.ord - shift).chr
    end
  end
end

def check_message(message, shift)
  message.count do |word|
    WORDS.include?(shift_characters(word, shift).join)
  end
end

def break_caesar(message)
  # Let's sanitize the message, removing anything but letters and separating all words in an array
  clean_message = message.downcase.split(/[^a-z]+/)

  # Let's create an array which will contain the count of words matching the number of characters we shift
  shifts = []
  26.times do |shift|
    shifts << check_message(clean_message, shift)
  end

  # We return the index (which is the shift) for which we have the maximum number of matching words
  shifts.index(shifts.max)
end
