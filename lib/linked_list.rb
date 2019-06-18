require 'pry'

class LinkedList
  attr_accessor :head,
                # :to_string
                # :count
  def initialize
    # @count = 0
    # @to_string = ""
    @head = nil
  end

  def empty?
    head.nil?
  end

  # def count
  #   if @to_string == ""
  #     0
  #   else
  #     @to_string.split(" ").count
  #   end
  # end

  def count(node)
    counter = 0
  
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def append(data)
    node = Node.new(data)
    if empty?
      if self.head = node
         # @count += 1
      # @to_string << @head.data
      @head.data
       end
    else
      if new_node = self.last_node(self.head)
        new_node.next_node = node
        # @count += 1
      # @to_string <<  " " + new_node.next_node.data
      new_node.next_node.data
      end
    end
  end
end
