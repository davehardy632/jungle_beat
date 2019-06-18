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

  def count
    counter(self.head, 0)
  end

  def collect_data(node, string = "")
    if empty?
      return ""
    else
      string << " " + node.data
      if node.tail?
        string.lstrip!
      else
        collect_data(node.next_node, string)
      end
    end
  end

  def to_string
    collect_data(self.head)
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def append(data)
    node = Node.new(data)
    if empty?
      self.head = node
      @head.data
    else
      new_node = self.last_node(self.head)
      new_node.next_node = node
      new_node.next_node.data
    end
  end

  def reset_list(array)
    self.head = nil
    array.each do |data|
      append(data)
    end
  end

  def prepend(data)
    node = Node.new(data)
    if empty?
      self.head = node
      @head.data
    else
      string = self.to_string
      array = string.prepend(data + " ").split
      reset_list(array)
      self.head.data
    end
  end

  def insert(position, data)
    if empty?
      self.head = node
      @head.data
    else
      array = self.to_string.split
      array.insert(position, data)
      reset_list(array)
      data
    end
  end
end
