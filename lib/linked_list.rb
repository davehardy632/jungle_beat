require 'pry'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
    @head.data
  end

  def count
    sum = 1
    if @head.data != nil && @head.next_node == nil
      return 1
    end
  end

  def to_string
    @head.data
  end
end
