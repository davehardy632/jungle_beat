require 'pry'

class LinkedList
  attr_accessor :head, :count, :to_string
  def initialize
    @count = 0
    @to_string = ""
    @head = nil
  end

  def empty?
    head.nil?
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def append(data)
    if empty?
      if self.head = Node.new(data)
         @count += 1
      @to_string << @head.data
       end
    else
      new_node = self.last_node(self.head)
        if new_node.next_node = Node.new(data)
        @count += 1
      @to_string <<  " " + new_node.next_node.data
      end
    end
  end
end
