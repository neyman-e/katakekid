def decode(label, value)
  ascii_number = label.chars.map(&:ord)
  ((value + ascii_number) * 17) % 256
end

filename = 'hash.txt'
# filename = 'example.txt'
# filename = 'input.txt'

data = File.read(filename)
array = data.strip.split(',')

boxes = Array.new(256, [])
array.each do |step|
  if step.include?('-')
    label = step.strip.gsub('-', '')
    value = decode(label, 0)
    boxes[value].delete(label) if boxes[value].has_key(label)
  else
  label, focal_length = step.split(/[=-]/)
  focal_length = focal_length.to_i
  ascii_numbers = label.chars.map(&:ord)
  value = decode(label, 0)
  boxes[value][]
  puts "#{step} - box #{value}"
  steps << value
end

puts "The sum is #{steps.sum}"
