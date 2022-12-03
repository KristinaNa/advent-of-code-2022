file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)

file_data = file_data.map{ |row| row.split }
winning_matrix = {
    "A" => "Y",
    "B" => "Z",
    "C" => "X"
}

resource_mapping = {
    "A" => "X",
    "B" => "Y",
    "C" => "Z"
}

my_move_mapping = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3
}

sum = 0

for round in file_data do
    opponent_move = round[0]
    my_move = round[1]

    my_move_score = my_move_mapping[my_move]
    round_score = 0

    if (resource_mapping[opponent_move] == my_move)
        round_score = 3
    elsif (winning_matrix[opponent_move] == my_move)
        round_score = 6
    else
        round_score = 0
    end

    sum += my_move_score+round_score
end

p "1 star result: #{sum}"
