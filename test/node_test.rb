require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require 'pry'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("plop")
  end

  def test_node_exists
    assert_instance_of Node, @node
  end

  def test_node_attributes
    assert_equal "plop", @node.data
    assert_nil @node.next_node
  end

  def test_if_node_is_tail
    assert_equal true, @node.tail?
    @node.next_node = "Whatevs"
    assert_equal false, @node.tail?
    assert_equal "Whatevs", @node.next_node
  end

end
