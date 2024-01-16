# frozen_string_literal: false

# Class to validate the board
class Auth < Board
  def initialize
    super
    @max_valid_addition = 45
  end

  def valid_row?(row)
    return nil if row.contains?(0)

    row_sum = row.inject(0) { |sum, x| sum + x }
    row_sum == @max_valid_addition
  end
end
