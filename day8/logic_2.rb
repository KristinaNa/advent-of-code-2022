require 'matrix'

file = File.open("input.rb")
file_data = file.readlines.map{|row| row.chomp.chars.map(&:to_i)}
matrix = Matrix.rows(file_data)

matrix_width = matrix.row_size()
matrix_height = matrix.column_size()

always_visible_trees_number = (matrix_width * 2) + (matrix_height - 2) * 2

def check_top_column(matrix, tree_height, row, column)
  counter = 0

  (row+1).times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row-i, column]
    counter += 1

    if (top_tree > (tree_height-1))
      return counter
    end
  end

  return counter
end

def check_bottom_column(matrix, tree_height, row, column, matrix_height)
  counter = 0

  matrix_height.times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row+i, column]
    counter += 1

    if (top_tree > (tree_height-1))
      return counter
    end
  end

  return counter
end

def check_left_row(matrix, tree_height, row, column)
  counter = 0

  (column+1).times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row, column-i]
    counter += 1

    if (top_tree > (tree_height-1))
      return counter
    end
  end

  return counter
end

def check_right_row(matrix, tree_height, row, column, matrix_width)
  counter = 0

  matrix_width.times do |i|
    if i == 0
      next
    end

    top_tree = matrix[row, column+i]
    counter += 1

    if (top_tree > (tree_height-1))
      return counter
    end
  end

  return counter
end


max = 0

matrix.each_with_index do |tree_height, row, column|
  if row == 0 || column == 0 || row == matrix_width-1 || column == matrix_height-1
    next
  end

  top = check_top_column(matrix, tree_height, row, column)
  bottom = check_bottom_column(matrix, tree_height, row, column, matrix_height-row)
  left = check_left_row(matrix, tree_height, row, column)
  right = check_right_row(matrix, tree_height, row, column, matrix_width-column)

  count = top * bottom * left * right

  if count > max
    max = count
  end
end

p "Result: #{max}"
