# frozen_string_literal: false

# Class to create the board
class Board
  attr_reader :board

  def initialize
    @board = Array.new(9) { Array.new(9, 0) }
  end

  def fill_box(row, col, value)
    @board[row][col] = value
  end

  def reset_board
    @board = Array.new(9) { Array.new(9, 0) }
  end
end
