require 'matrix'

file = File.open("input.rb")
file_data = file.readlines.map{|row| row.chomp.chars.map(&:to_i)}
matrix = Matrix.rows(file_data)

matrix_width = matrix.row_size()
matrix_height = matrix.column_size()

always_visible_trees_number = (matrix_width * 2) + (matrix_height - 2) * 2

def check_top_column(matrix, tree_height, row, column)
  (row+1).times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row-i, column]

    if (top_tree > (tree_height-1))
      return false
    end
  end

  return true
end

def check_bottom_column(matrix, tree_height, row, column, matrix_height)
  matrix_height.times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row+i, column]

    if (top_tree > (tree_height-1))
      return false
    end
  end

  return true
end

def check_left_row(matrix, tree_height, row, column)
  (column+1).times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row, column-i]

    if (top_tree > (tree_height-1))
      return false
    end
  end

  return true
end

def check_right_row(matrix, tree_height, row, column, matrix_width)
  matrix_width.times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row, column+i]

    if (top_tree > (tree_height-1))
      return false
    end
  end

  return true
end

counter = 0
matrix.each_with_index do |tree_height, row, column|
  if row == 0 || column == 0 || row == matrix_width-1 || column == matrix_height-1
    next
  end

  if [
    check_top_column(matrix, tree_height, row, column),
    check_bottom_column(matrix, tree_height, row, column, matrix_height-row),
    check_left_row(matrix, tree_height, row, column),
    check_right_row(matrix, tree_height, row, column, matrix_width-column)
  ].include?(true)
    counter += 1
  end
end

p "Result: #{counter + always_visible_trees_number}"
