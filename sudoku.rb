# frozen_string_literal: false

require_relative 'helpers/validation'

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end
end


def get_index(index)
  return false unless index.between?(1, 81)

  row = (index - 1) / 9
  col = (index - 1) % 9

  [row, col]
end

def make_array_map
  matrix_map = Array.new(9) { Array.new(9) }
  count = 1

  matrix_map.each_with_index do |row, row_index|
    row.each_with_index do |_, col_index|
      matrix_map[row_index][col_index] = count
      count += 1
    end
  end

  matrix_map
end

def wait_input_box
  puts 'On line...'
  gets.chomp.to_i
end

def wait_input_value
  puts 'Enter value...'
  gets.chomp.to_i
end

def wait_user
  puts 'Press enter to continue...'
  gets.chomp
end

def print_matrix(matrix)
  max_lengths = get_max_length(matrix)

  print_border_row(max_lengths)
  matrix.each do |row|
    row.each_with_index do |item, index|
      printf("| %#{max_lengths[index]}s ", item)
    end
    puts '|'
    print_border_row(max_lengths)
  end
end

def get_max_length(matrix)
  matrix.transpose.map do |col|
    col.map { |item| item.to_s.length }.max
  end
end

def print_border_row(max_lengths)
  puts "+#{max_lengths.map { |len| '-' * (len + 2) }.join('+')}+"
end

validation_obj = Validation.new

validation_obj.board = [
  [0, 0, 0, 0, 0, 0, 1, 6, 3],
  [0, 4, 9, 6, 0, 0, 5, 2, 7],
  [5, 0, 4, 0, 0, 0, 8, 6, 4],
  [4, 9, 0, 1, 0, 5, 3, 8, 2],
  [2, 1, 8, 0, 0, 0, 4, 4, 5],
  [0, 5, 0, 2, 0, 8, 9, 0, 6],
  [0, 0, 0, 0, 0, 0, 0, 0, 8],
  [0, 0, 5, 7, 0, 6, 2, 0, 0],
  [3, 0, 0, 9, 0, 0, 6, 0, 0]
]

matrix_map = make_array_map

loop do
  print_matrix(matrix_map)
  index = wait_input_box
  value = wait_input_value

  row, col = get_index(index)

  validation_obj.fill_box(row, col, value)

  puts ''
  print_matrix(validation_obj.board)

  puts 'Columns valid? ' + validation_obj.valid_col?.to_s
  puts 'Rows valid? ' + validation_obj.valid_row?.to_s
  puts 'Areas valid? ' + validation_obj.valid_area?.to_s
  wait_user
end
