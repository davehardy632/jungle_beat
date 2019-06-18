require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'
require 'pry'

class JungleBeatTest < Minitest::Test

  def setup
    @jb = JungleBeat.new
  end

  def test_jungle_beat_instance_exists
    assert_instance_of JungleBeat, @jb
  end

  def test_jb_is_initialized_with_empty_linked_list
    assert_instance_of LinkedList, @jb.list
  end

  def test_append_and_count_from_jb_instance
    assert_equal "deep doo ditt", @jb.append("deep doo ditt")
    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data
    assert_equal "ditt", @jb.list.head.next_node.next_node.data
    assert_equal "woo hoo shu", @jb.append("woo hoo shu")
    assert_equal 6, @jb.count
  end

  def test_append_works_for_longer_lists
    assert_equal "deep doo ditt woo hoo shu", @jb.append("deep doo ditt woo hoo shu")
    assert_equal 6, @jb.count
    assert_equal "", @jb.play
  end

end
