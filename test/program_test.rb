# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/program.rb"

class ProgramTest < Minitest::Test

  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

  def test_start_with_all_valid
    program = Program.new #setup

    with_stdin do |input|
      input.puts "3"
      input.puts "1 2 3"
      input.puts "5"
      input.puts "1 2 3 4 5"

      program.start
    end
    assert_equal(3, program.set_a[:max_elements])
    assert_equal([1, 2, 3], program.set_a[:elements])
    assert_equal(5, program.set_b[:max_elements])
    assert_equal([1, 2, 3, 4, 5], program.set_b[:elements])
  end

  def test_start_when_max_elements_is_invalid
    program = Program.new #setup

    with_stdin do |input|
      input.puts "51"
      input.puts "5"
      input.puts "1 2 3 4 5"
      input.puts "0"
      input.puts "3"
      input.puts "0 1 2"

      program.start
    end
    assert_equal(5, program.set_a[:max_elements])
    assert_equal(3, program.set_b[:max_elements])
  end

  def test_start_when_number_of_elements_is_different_from_max_elements
    program = Program.new

    with_stdin do |input|
      input.puts "3"
      input.puts "5 3 4 5 6"
      input.puts "2"
      input.puts "5 4 5"
      input.puts "2"
      input.puts "0 8 6"
      input.puts "0 8"

      program.start
    end
    assert_equal([5, 4, 5], program.set_a[:elements])
    assert_equal([0, 8], program.set_b[:elements])
  end
end
