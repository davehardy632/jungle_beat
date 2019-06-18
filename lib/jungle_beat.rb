require 'pry'

class JungleBeat
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(data_list)
    data_array = data_list.split
    self.list.set_list(data_array)
    data_list
  end

  def count
    self.list.count
  end

  def play
    beats = self.list.to_string
    `say -r 250 -v Alex "#{beats}"`
  end
end
