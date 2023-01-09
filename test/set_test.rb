# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/set.rb"

class SetTest < Minitest::Test

  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end
end

  def test_intersection_when_is_a_intersection_of_two_sets
    set = Set.new

    with_stdin do |input|
      input.puts "3"
      input.puts "1 2 3"
      input.puts "5"
      input.puts "1 2 3 4 5"

      set.start
  end
      assert_equal([1, 2], set.set_a.intersection(set.set_b))
  end
end

def test_when_is_a_intersection_of_two_sets
  set_a = Set.new()
  set_b = Set.new()
  set_a.add(1)
  set_a.add(2)
  set_a.add(3)
  set_b.add(2)
  set_b.add(3)
  set_b.add(4)
  assert_equal(set_a.intersection(set_b), [2, 3])
end

def test_when_is_a_difference_of_two_sets
  set_a = Set.new()
  set_b = Set.new()
  set_a.add(1)
  set_a.add(2)
  set_a.add(3)
  set_b.add(2)
  set_b.add(3)
  set_b.add(4)
  assert_equal(set_a.difference(set_b), [1])
end

def test_when_is_a_subset_of_two_sets
  set_a = Set.new()
  set_b = Set.new()
  set_a.add(1)
  set_a.add(2)
  set_a.add(3)
  set_b.add(2)
  set_b.add(3)
  set_b.add(4)
  assert_equal(set_a.subset?(set_b), true)
  end
end