def check_message(message, shift)
  message.count do |word|
    WORDS.include?(word.tr('a-z', ('a'..'z').to_a.rotate(-shift).join))
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
