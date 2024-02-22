class Node
  attr_accessor :next
end

def loop_size(node)
  # If the loop size is 1 we return it straight away
  return 1 if node == node.next

  # Create an array which will contain all the nodes we "pass"
  nodes_list = []
  next_node = node.next

  # Append the starting node to the Array
  nodes_list << node

  # Keep appending nodes to the array, until we find that the next node is already include
  # That means we've found the node being the start of the loop
  until nodes_list.include?(next_node)
    nodes_list << next_node
    next_node = next_node.next
  end

  # Append the last node of the loop (the one connecting to the first one)
  nodes_list << next_node

  # We finally check the index of the first node (which is the next node of the last one) to return the loop's size
  loop_start_index = nodes_list.index(next_node.next)
  nodes_list.size - loop_start_index
end

#use this if you want to create your code on you computer the class of the node is in the description
def create_chain_for_test(tail_size, loop_size)
  prev_node = start = Node.new
  start.next = start
  return start if loop_size == 1
  (1..tail_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  end_loop = prev_node
  (1...loop_size).each do |i|
    prev_node.next = Node.new
    prev_node = prev_node.next
  end
  prev_node.next = end_loop
  start
end

node = create_chain_for_test(4, 500)
p loop_size(node)
