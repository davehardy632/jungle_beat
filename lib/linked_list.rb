require 'pry'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def empty?
    head.nil?
  end

  def counter(node, counter = 0)
    if empty?
      counter
    elsif node.tail?
      counter += 1
    else counter(node.next_node, counter + 1)
    end
  end

  def count
    counter(self.head, 0)
  end

  def collect_data(node, string = "")
    if empty?
      return ""
    elsif node.tail?
      (string << " " + node.data).lstrip!
    else
      collect_data(node.next_node, (string << " " + node.data) )
    end
  end

  def to_string
    collect_data(self.head)
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def set_head(data)
    self.head = Node.new(data)
    @head.data
  end

  def append(data)
    if empty?
      set_head(data)
    else
      new_node = self.last_node(self.head)
      new_node.next_node = Node.new(data)
      new_node.next_node.data
    end
  end

  def set_list(array)
    array.each do |data|
      append(data)
    end
  end

  def reset_list(array)
    self.head = nil
    array.each do |data|
      append(data)
    end
    self.head.data
  end

  def prepend(data)
    if empty?
      set_head(data)
    else
      reset_list(self.to_string.prepend(data + " ").split)
    end
  end

  def insert(position, data)
    if empty?
      set_head(data)
    else
      reset_list(self.to_string.split.insert(position, data))
      data
    end
  end

  def pop
    array = self.to_string.split
    return_value = array.pop
    reset_list(array) unless array == []
    return_value
  end

  def find(position, number)
    array = self.to_string.split
    array.shift(position)
    array.pop(array.length - number)
    array.join(" ")
  end

  def includes?(data)
    array = self.to_string.split
    array.include?(data)
  end
end
