# frozen_string_literal: false

require 'minitest/autorun'
require_relative './../helpers/board'
require_relative './../helpers/validation'

class TestMinitest < Minitest::Test
  def test_fill_box
    b = Board.new
    b.fill_box(1, 1, 1)

    assert_equal(1, b.board[1][1])
  end

  def test_reset_board
    b = Board.new
    b.fill_box(0, 0, 1)
    b.fill_box(5, 8, 1)
    b.reset_board

    assert b.board.include?(1) == false
  end

  def test_valid_row
    b = Validation.new
    b.fill_box(0, 0, 1)
    b.fill_box(0, 1, 2)
    b.fill_box(0, 2, 3)
    b.fill_box(0, 3, 4)
    b.fill_box(0, 4, 5)
    b.fill_box(0, 5, 6)
    b.fill_box(0, 6, 7)
    b.fill_box(0, 7, 8)
    b.fill_box(0, 8, 9)

    assert_equal(true, b.valid_row?)
  end

  def test_valid_column
    b = Validation.new
    b.fill_box(0, 0, 1)
    b.fill_box(1, 0, 2)
    b.fill_box(2, 0, 3)
    b.fill_box(3, 0, 4)
    b.fill_box(4, 0, 5)
    b.fill_box(5, 0, 6)
    b.fill_box(6, 0, 7)
    b.fill_box(7, 0, 8)
    b.fill_box(8, 0, 9)

    assert_equal(true, b.valid_col?)
  end

  def test_valid_area
    b = Validation.new
    b.fill_box(0, 0, 1)
    b.fill_box(0, 1, 2)
    b.fill_box(0, 2, 3)
    b.fill_box(1, 0, 4)
    b.fill_box(1, 1, 5)
    b.fill_box(1, 2, 6)
    b.fill_box(2, 0, 7)
    b.fill_box(2, 1, 8)
    b.fill_box(2, 2, 9)

    assert_equal(true, b.valid_area?)
  end
end
