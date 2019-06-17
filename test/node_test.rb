require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("plop")
  end

  def test_that_node_exists
    assert_instance_of Node, @node
  end

  def test_that_node_has_data_and_chain
    assert_equal "plop", @node.data
    assert_nil @node.next_node
  end
end
