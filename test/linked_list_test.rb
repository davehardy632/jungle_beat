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

  def test_head_begins_as_nil
    assert_nil @list.head
    @list.append("deep")
    assert_equal false, @list.head.nil?
  end

  def test_head_is_set_as_a_node
    @list.append("doop")
    assert_instance_of Node, @list.head
  end

  def test_node_data_is_set_with_append_method
    @list.append("doop")
    assert_equal "doop", @list.head.data
  end

  def test_next_node_is_nil_when_appended_once
    @list.append("doop")
    assert_nil @list.head.next_node
  end

  def test_append_once
    assert_equal "doop", @list.append("doop")
    assert_instance_of Node, @list.head
    assert_equal "doop", @list.head.data
  end

  def test_empty_method
    assert_equal true, @list.empty?
    @list.append("deep")
    assert_equal false, @list.empty?
  end

  def test_counter_method
    @list.append("doop")
    @list.append("deep")
    @list.append("wubba")
    assert_equal 3, @list.counter(@list.head, 0)
  end

  def test_count_method
    assert_equal 0, @list.count
    list = ["deep", "doop", "wubba", "wabba"]
    @list.set_list(list)
    assert_equal 4, @list.count
  end

  def test_collect_data_method
    assert_equal "", @list.collect_data(@list.head)
    @list.append("doop")
    @list.append("deep")
    @list.append("wubba")
    assert_equal "doop deep wubba", @list.to_string
  end

  def test_to_string_method
    assert_equal "", @list.to_string
    @list.append("deep")
    @list.append("doop")
    @list.append("boop")
    assert_equal "deep doop boop", @list.to_string
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
    @list.append("wubba")
    @list.append("wabba")
    assert_equal "deep", @list.head.next_node.data
    assert_equal 4, @list.count
    assert_equal "doop deep wubba wabba", @list.to_string
  end

  def test_set_list_method
    new_list_data_array = ["setting", "new", "list"]
    assert_nil @list.head
    @list.set_list(new_list_data_array)
    assert_equal "setting", @list.head.data
    assert_equal "new", @list.head.next_node.data
    assert_equal "list", @list.head.next_node.next_node.data
  end

  def test_reset_list_method
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    new_data_array = ["reset", "the", "list"]
    @list.reset_list(new_data_array)
    assert_equal "reset", @list.head.data
    assert_equal "the", @list.head.next_node.data
    assert_equal "list", @list.head.next_node.next_node.data
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
end
