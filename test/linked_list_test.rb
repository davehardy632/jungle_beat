require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require 'pry'

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
    assert_equal Node, @list.head.class
    assert_equal 'doop', @list.head.data
    assert_nil @list.head.next_node
  end

  def test_list_methods
    assert_equal 0, @list.count
    assert_equal "doop", @list.append("doop")
    assert_equal 1, @list.count
    assert_equal "doop", @list.to_string
  end

  def test_last_node_method
    @list.append("doop")
    @list.append("deep")
    assert_equal Node, @list.last_node(@list.head).class
    assert_equal "deep", @list.last_node(@list.head).data
  end

  def test_append_multiple_nodes
    @list.append("doop")
    @list.append("deep")
    assert_equal "deep", @list.head.next_node.data

    assert_equal 2, @list.count(@list.head)
    # assert_equal "doop deep", @list.to_string
  end
end
