# require 'matrix'

schematic_file = 'smaller-input.txt'
# schematic_file = 'input.txt'


def is_digit(char)
  char.match?(/\d/)
end

def is_symbol(char)
  char.match?(/[^\d.]/)
end

def read_matrix(lines)
end

input = File.open(schematic_file)
lines = input.readlines
input.close

raw_matrix = []

puts "Matrix:"
lines.each_with_index do |line, index|
  raw_matrix << line.chomp.chars
  print index
  p line.chomp.chars
end

numbers_hash = {}

symbols_hash = {}
for index in 0..raw_matrix[0].length - 1
  symbols_hash[index.to_s] = {}
end

for row in 0..raw_matrix.size - 1
  aux_number = 0
  for col in 0..raw_matrix.size - 1
    number_end = false
    if is_symbol(raw_matrix[row][col])
      if symbols_hash.has_key?(row.to_s)
        symbols_hash[row.to_s][col.to_s] = raw_matrix[row][col]
      else
        symbols_hash[row.to_s] = { col.to_s => raw_matrix[row][col] }
      end
    end
    if is_digit(raw_matrix[row][col]) && col == 15
      aux_number = aux_number * 10 + raw_matrix[row][col].to_i
      number_end = true
    elsif is_digit(raw_matrix[row][col])
      aux_number = aux_number * 10 + raw_matrix[row][col].to_i
    elsif !is_digit(raw_matrix[row][col]) && aux_number > 0
      number_end = true
    end
    if number_end
      if numbers_hash.has_key?(row.to_s)
        numbers_hash[row.to_s][(col - aux_number.to_s.length).to_s] = aux_number
      else
        numbers_hash[row.to_s] = { (col - aux_number.to_s.length).to_s => aux_number }
      end
      # for index in 1..aux_number.to_s.length
      #   # puts "#{aux_number} - #{col - index}"
      #   if numbers_hash.has_key?(row.to_s)
      #     numbers_hash[row.to_s][(col - index).to_s] = aux_number
      #   else
      #     numbers_hash[row.to_s] = { (col - index).to_s => aux_number }
      #   end
      # end
      aux_number = 0
    end
  end
end

puts "\nNumbers:"
numbers_hash.each { |line| p line }
puts "\nSymbols:"
symbols_hash.each { |line| p line }

def is_engine_part(row, col_begin, col_end, symbols_hash, raw_matrix)
  is_engine_part = false
  is_engine_part = true if row > 0 &&
                            col_begin > 0 &&
                            symbols_hash[(row - 1).to_s].has_key?((col_begin - 1).to_s)
  is_engine_part = true if row > 0 &&
                            col_end < raw_matrix[0].length - 1 &&
                            symbols_hash[(row - 1).to_s].has_key?((col_end + 1).to_s)
  is_engine_part = true if row < raw_matrix[0].length - 1 &&
                            col_begin > 0 &&
                            symbols_hash[(row + 1).to_s].has_key?((col_begin - 1).to_s)
  is_engine_part = true if row < raw_matrix[0].length - 1 &&
                            col_end < raw_matrix[0].length - 1 &&
                            symbols_hash[(row + 1).to_s].has_key?((col_end + 1).to_s)
  is_engine_part = true if row > 0 &&
                            symbols_hash[(row).to_s].has_key?((col_begin - 1).to_s)
  is_engine_part = true if row < raw_matrix[0].length - 1 &&
                            symbols_hash[(row).to_s].has_key?((col_end + 1).to_s)
  if row > 0
    for column in col_begin..col_end
      is_engine_part = true if symbols_hash[(row - 1).to_s].has_key?((column).to_s)
    end
  end
  if row < raw_matrix[0].length - 1
    for column in col_begin..col_end
      is_engine_part = true if symbols_hash[(row + 1).to_s].has_key?((column).to_s)
    end
  end
  is_engine_part
end

all_numbers = []

numbers_hash.each do |row|
  row_index = row[0].to_i
  row[1].each_pair do |col, number|
    col_begin = col.to_i
    col_end = col_begin + number.to_s.length - 1
    all_numbers << number if is_engine_part(row_index, col_begin, col_end, symbols_hash, raw_matrix)
  end
end

# def check_around_symbols(row, col, numbers_hash)
#   numbers = []
#   if numbers_hash.has_key?(row.to_s)
#     numbers << numbers_hash[row.to_s][(col - 1).to_s] if numbers_hash[row.to_s].has_key?((col - 1).to_s)
#     numbers << numbers_hash[row.to_s][(col + 1).to_s] if numbers_hash[row.to_s].has_key?((col + 1).to_s)
#   end
#   if numbers_hash.has_key?((row - 1).to_s)
#     if numbers_hash[(row - 1).to_s].has_key?(col.to_s)
#       numbers << numbers_hash[(row - 1).to_s][col.to_s]
#     else
#       numbers << numbers_hash[(row - 1).to_s][(col - 1).to_s] if numbers_hash[(row - 1).to_s].has_key?((col - 1).to_s)
#       numbers << numbers_hash[(row - 1).to_s][(col + 1).to_s] if numbers_hash[(row - 1).to_s].has_key?((col + 1).to_s)
#     end
#   end
#   if numbers_hash.has_key?((row + 1).to_s)
#     if numbers_hash[(row + 1).to_s].has_key?((col + 1).to_s)
#       numbers << numbers_hash[(row + 1).to_s][(col + 1).to_s]
#     else
#       numbers << numbers_hash[(row + 1).to_s][(col - 1).to_s] if numbers_hash[(row + 1).to_s].has_key?((col - 1).to_s)
#       numbers << numbers_hash[(row + 1).to_s][(col + 1).to_s] if numbers_hash[(row + 1).to_s].has_key?((col + 1).to_s)
#     end
#   end
#   numbers
# end

# all_numbers = []

# symbols_hash.each do |row|
#   row_index = row[0].to_i
#   row[1].each_key do |col|
#     col_index = col.to_i
#     all_numbers << check_around_symbols(row_index, col_index, numbers_hash)
#   end
# end

# puts "\nNumbers to be summed up:"
# puts all_numbers

puts "\nThe result of engine part numbers' sum is: #{all_numbers.flatten.sum}"


# puts
# p symbols_hash

# puts
# row = 2
# col_begin = 6
# col_end = 8
# puts is_engine_part(row, col_begin, col_end, symbols_hash, raw_matrix)
# puts symbols_hash[(row).to_s].has_key?((col_end + 1).to_s)
