require 'set'
ENCRYPTED_WORDS = ["DAM?", "Mjqqt, btwqi!", "DAM? DAM! DAM.", "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."]
SEPARATE_ENCRYPTED_WORDS = ["DAM", "Mjqqt", "btwqi", "Gur", "dhvpx", "oebja", "sbk",
                            "whzcf", "bire", "gur", "ynml", "qbt"].to_set
WORDS = ["wtf", "hello", "world", "the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"].sort.to_set

def shift_characters(phrase, shift)
  phrase.downcase.chars.map do |char|
    if char.ord >= 97 && char.ord <= 122
      if (char.ord - shift) >= 97
        (char.ord - shift).chr
      else
        (26 + char.ord - shift).chr
      end
    end
  end
end

def check_words(dictionary, words, shift)
  all_words_included = dictionary.include?(shift_characters(words[0], shift).join)
  return all_words_included unless all_words_included
  words.each do |word|
    all_words_correct = false unless dictionary.include?(shift_characters(word, shift).join)
    return all_words_included unless all_words_included
    # p shift_characters(word, shift).join
  end
end

def break_caesar(message)
  combination_found = false
  clean_message = message.downcase.split(/[^a-zA-Z]+/)
  shift = 0
  until combination_found || shift == 25
    combination_found = check_words(WORDS, clean_message, shift)
    shift += 1
  end
  shift - 1
end

# def word_shifts(word)
#   chars_shifts = []
#   chars = word.downcase.chars
#   chars.each_index do |index|
#     if chars[index].ord < chars[index - 1].ord
#       chars_shifts << (26 + chars[index].ord - chars[index - 1].ord)
#     else
#       chars_shifts << (chars[index].ord - chars[index - 1].ord)
#     end
#   end
#   chars_shifts
# end

# def shift_number(encrypted_word, decrypted_word)
#   first_encrypted_char = encrypted_word.chars[0]
#   first_decrypted_char = decrypted_word.chars[0]
#   shift = 0
#   if first_decrypted_char.ord < first_encrypted_char.ord
#     shift = first_encrypted_char.ord - first_decrypted_char.ord
#   elsif first_decrypted_char.ord == first_encrypted_char.ord
#     shift = 0
#   else
#     shift = 26 + first_encrypted_char.ord - first_decrypted_char.ord
#   end
#   shift
# end
