# frozen_string_literal: false

require_relative 'board'

# Class to validate the board
class Validation < Board
  def initialize
    super
    @max_valid_addition = 45
    @area_centers = [[1, 1], [1, 4], [1, 7], [4, 1], [4, 4], [4, 7], [7, 1], [7, 4], [7, 7]]
  end

  def valid_row?
    board.each do |row|
      next if row.include?(0)

      row_sum = row.inject(0) { |sum, x| sum + x }
      return false unless row_sum == @max_valid_addition
    end

    true
  end

  def valid_col?
    board.transpose.each do |col|
      next if col.include?(0)

      col_sum = col.inject(0) { |sum, x| sum + x }
      return false unless col_sum == @max_valid_addition
    end

    true
  end

  def valid_area?
    @area_centers.each do |center|
      area_sum = 0
      area_sum += board[center[0] - 1][center[1] - 1].zero? ? next : board[center[0] - 1][center[1] - 1] # top left
      area_sum += board[center[0] - 1][center[1]].zero? ? next : board[center[0] - 1][center[1]] # top center
      area_sum += board[center[0] - 1][center[1] + 1].zero? ? next : board[center[0] - 1][center[1] + 1] # top right
      area_sum += board[center[0]][center[1] - 1].zero? ? next : board[center[0]][center[1] - 1] # center left
      area_sum += board[center[0]][center[1]].zero? ? next : board[center[0]][center[1]] # center center
      area_sum += board[center[0]][center[1] + 1].zero? ? next : board[center[0]][center[1] + 1] # center right
      area_sum += board[center[0] + 1][center[1] - 1].zero? ? next : board[center[0] + 1][center[1] - 1] # bottom left
      area_sum += board[center[0] + 1][center[1]].zero? ? next : board[center[0] + 1][center[1]] # bottom center
      area_sum += board[center[0] + 1][center[1] + 1].zero? ? next : board[center[0] + 1][center[1] + 1] # bottom right

      return false unless area_sum == @max_valid_addition
    end

    true
  end
end
