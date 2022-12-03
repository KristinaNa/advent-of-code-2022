file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)

file_data = file_data.map{ |row| row.split }
winning_matrix = {
    "A" => "B",
    "B" => "C",
    "C" => "A"
}

lose_matrix = {
    "A" => "C",
    "B" => "A",
    "C" => "B"
}

my_move_mapping = {
    "A" => 1,
    "B" => 2,
    "C" => 3
}

result_mapping = {
    "Y" => 3,
    "X" => 0,
    "Z" => 6
}

sum = 0

for round in file_data do
    opponent_move = round[0]
    move_result = round[1]
    round_score = 0
    my_move_score = 0

    if (result_mapping[move_result] == 3)
        round_score = 3
        my_move_score = my_move_mapping[opponent_move]
    elsif (result_mapping[move_result] == 6)
        round_score = 6
        move = winning_matrix[opponent_move]
        my_move_score = my_move_mapping[move]
    else
        round_score = 0
        move = lose_matrix[opponent_move]
        my_move_score = my_move_mapping[move]
    end

    sum += my_move_score+round_score
end

p "2 star result: #{sum}"
