require_relative 'data'
require_relative 'links-list'

data = Data.new('input.txt')
sequence = data.sequence
links = {}

data.links.each do |line|
  link = line.split(/[^A-Z]+/)
  links[link[0]] = [link[1], link[2]]
end

start_link = 'AAA'
end_link = 'ZZZ'
current_link = start_link
count = 0

sequence.cycle do |direction|
  current_link = links[current_link][direction]
  count += 1
  break if current_link == end_link
end

puts count
