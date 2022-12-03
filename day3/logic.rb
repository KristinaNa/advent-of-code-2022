file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)

alphabet_array = ('a'..'z').to_a + ('A'..'Z').to_a
sum = 0

for rucksack in file_data do
    compartments = rucksack.chars.each_slice(rucksack.length / 2).map(&:join)
    duplicates = []

    first_chars = compartments[0].split('')

    first_chars.each do |x| 
        if (compartments[1].include? x)
            duplicates.push(alphabet_array.find_index(x)+1)
        end     
    end
    
    sum += duplicates.uniq[0]
end

p sum