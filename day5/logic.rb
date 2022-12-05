file = File.open("input.rb").readlines
empty_line = file.find_index("\n")
indexes = [1, 5, 9, 13, 17, 21, 25, 29, 33]

stacks = file.slice(0, empty_line).map(&:chomp)
moves = file.slice(empty_line+1, file.length-1).map(&:chomp)

data = {}

for stack in stacks do
  for i in indexes do
    if match = /[[:upper:]]/.match(stack[i])

      column = indexes.index(i)
      data_map = data[column+1]

      if data_map.nil?
        data[column+1] = [match[0]]
      else
        data[column+1] = data_map.push(match[0])
      end
    end
  end
end

data = data.map{|column_number, column_data|  [column_number, column_data.reverse()]}.to_h

for move in moves do
  numbers = move.scan(/\d+/)

  quantity = numbers[0].to_i
  from = numbers[1].to_i
  to = numbers[2].to_i

  elements_to_move = data[from].last(quantity)

  data[to].push(*elements_to_move.reverse()) # First star solution
  # data[to].push(*elements_to_move) # Second star solution

  data[from].pop(quantity)
end

p data.sort.map{ |r, a| a.last }.join()
