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
    assert_equal true, @list.empty?
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

  def test_counter_method
    @list.append("doop")
    @list.append("deep")
    @list.append("wubba")
    assert_equal 3, @list.counter(@list.head, 0)
  end

  def test_collect_data_method
    @list.append("doop")
    @list.append("deep")
    @list.append("wubba")
    assert_equal "doop deep wubba", @list.to_string
  end

  def test_append_multiple_nodes
    @list.append("doop")
    @list.append("deep")
    @list.append("wubba")
    @list.append("wabba")
    assert_equal "deep", @list.head.next_node.data
    assert_equal 4, @list.count
    assert_equal "doop deep wubba wabba", @list.to_string
  end

  def test_prepend_method
    assert_equal "plop", @list.append("plop")
    assert_equal "plop", @list.to_string
    assert_equal "suu", @list.append("suu")
    assert_equal "dop", @list.prepend("dop")
    assert_equal "dop plop suu", @list.to_string
    assert_equal 3, @list.count
  end

  def test_insert_method
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    assert_equal "woo", @list.insert(1, "woo")
    assert_equal "dop woo plop suu", @list.to_string
  end

  def test_find_method
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    @list.append("shu")
    @list.append("blop")
    assert_equal "deep woo shi shu blop", @list.to_string
    assert_equal "shi", @list.find(2, 1)
    assert_equal "woo shi shu", @list.find(1, 3)
    assert_equal "shu blop", @list.find(3, 2)
    assert_equal "deep woo shi", @list.find(0, 3)
  end

  def test_includes_method
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    @list.append("shu")
    @list.append("blop")
    assert_equal true, @list.includes?("deep")
    assert_equal false, @list.includes?("dep")
  end

  def test_pop_method
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    @list.append("shu")
    @list.append("blop")
    assert_equal "blop", @list.pop
    assert_equal "shu", @list.pop
    assert_equal "deep woo shi", @list.to_string
  end

end
