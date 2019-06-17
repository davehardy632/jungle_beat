require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

  def setup
    @list = LinkedList.new
  end

  def test_list_exists
    assert_instance_of LinkedList, @list
  end

  def test_list_attributes
    assert_nil @list.head
    assert_equal "doop", @list.append("doop")
  end

  def test_list_state
    assert_equal "doop", @list.append("doop")
    assert_equal Node, @list.head.class
    assert_nil @list.head.next_node
  end

  def test_list_methods
    assert_equal "doop", @list.append("doop")
    assert_equal 1, @list.count
    assert_equal "doop", @list.to_string
  end
end
