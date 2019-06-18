require 'pry'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def empty?
    head.nil?
  end

  def counter(node, counter)
    if empty?
      0
    else
      counter += 1
      if node.tail?
        counter
      else counter(node.next_node, counter)
      end
    end
  end

  def count(node)
    counter(node, 0)
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def to_string(node)
    if empty
  end

  def append(data)
    node = Node.new(data)
    if empty?
      if self.head = node
      @head.data
       end
    else
      if new_node = self.last_node(self.head)
        new_node.next_node = node
      new_node.next_node.data
      end
    end
  end
end
