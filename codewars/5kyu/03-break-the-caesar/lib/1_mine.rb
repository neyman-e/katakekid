require 'set'
ENCRYPTED_WORDS = ["DAM?", "Mjqqt, btwqi!", "DAM? DAM! DAM.", "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."]
SEPARATE_ENCRYPTED_WORDS = ["DAM", "Mjqqt", "btwqi", "Gur", "dhvpx", "oebja", "sbk",
                            "whzcf", "bire", "gur", "ynml", "qbt"].to_set
WORDS = ["wtf", "hello", "world", "the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"].sort.to_set

def word_shifts(word)
  chars_shifts = []
  chars = word.downcase.chars
  chars.each_index do |index|
    if chars[index].ord < chars[index - 1].ord
      chars_shifts << (26 + chars[index].ord - chars[index - 1].ord)
    else
      chars_shifts << (chars[index].ord - chars[index - 1].ord)
    end
  end
  chars_shifts
end

def shift_number(encrypted_word, decrypted_word)
  first_encrypted_char = encrypted_word.chars[0]
  first_decrypted_char = decrypted_word.chars[0]
  shift = 0
  if first_decrypted_char.ord < first_encrypted_char.ord
    shift = first_encrypted_char.ord - first_decrypted_char.ord
  else
    shift = 26 + first_encrypted_char.ord - first_decrypted_char.ord
  end
  shift
end

def break_caesar(message)
  words_shifts = WORDS.each_with_object({}) { |word, hash| hash[word_shifts(word)] = word }
  clean_message = message.downcase.split(/[^a-zA-Z]+/)
  first_decrypted_word = words_shifts[word_shifts(clean_message[0])]
  shift_number(clean_message[0], first_decrypted_word)
end

# words_shifts = WORDS.to_h { |word| [word_shifts(word), word] }

# def shift_characters(phrase, shift)
#   phrase.downcase.chars.map do |char|
#     if char.ord >= 97 && char.ord <= 122
#       if char.ord - shift >= 97
#         (char.ord - shift).chr
#       else
#         (26 + char.ord - shift).chr
#       end
#     end
#   end
# end

# SEPARATE_ENCRYPTED_WORDS.each { |string| p break_caesar(string)}
# p break_caesar(ENCRYPTED_WORDS[3])

# p shift_characters("wtf", 7).join
# p shift_characters("dam", 7).join

# words_shifts = WORDS.to_h { |word| [word_shifts(word), word]}
# p words_shifts

# separate_words_shifts = SEPARATE_ENCRYPTED_WORDS.to_h { |word| [word_shifts(word), word]}
# p separate_words_shifts
